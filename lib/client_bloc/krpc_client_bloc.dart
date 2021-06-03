import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:krpc_dart/client_bloc/encoded_protobufs.dart';
import 'package:krpc_dart/domain/exceptions/connection_exceptions.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../domain/connection/connection_parameters.dart';

part 'krpc_client_event.dart';
part 'krpc_client_state.dart';

class KrpcClientBloc extends Bloc<KrpcClientEvent, KrpcClientState> {
  KrpcClientBloc() : super(KrpcClientDisconnected());

  Socket? tcpSocket;

  WebSocketChannel? rpcChannel;
  Stream<Uint8List>? rpcStream;

  @override
  Stream<KrpcClientState> mapEventToState(
    KrpcClientEvent event,
  ) async* {
    if (event is TcpConnectionRequest) {
      yield KrpcClientConnecting();
      try {
        tcpSocket = await Socket.connect(
          event.parameters.ip,
          event.parameters.port,
          timeout: Duration(seconds: 5),
        );

        tcpSocket!.add(EncodedProtobufs.tcpConnectionRequest(
            clientName: event.parameters.clientName));

        final rawResponse = await tcpSocket!.first;
        print(rawResponse);
        throw UnimplementedError('TCP connection does not work (yet)');
        // Fails here for whatever reason
        final response = EncodedProtobufs.decodeTcpConnectionResponse(
            rawResponse);

        //print('${response.status.name}');

        yield KrpcClientConnected();
      } on SocketException catch (exception) {
        yield KrpcClientError(
            'Connection to kRPC failed... Wrong parameters? => $exception');
      } on Exception catch (exception) {
        yield KrpcClientError('UNKNOWN EXCEPTION: $exception');
      } on Error catch (error) {
        yield KrpcClientError('UNKNOWN ERROR: $error');
      }
    } else if (event is WebSocketChannelConnectionRequest) {
      yield KrpcClientConnecting();
      final addressString = _buildWebSocketAddress(event.parameters);

      rpcChannel = IOWebSocketChannel.connect(Uri.parse(addressString));

      if (rpcChannel != null) {
        rpcStream = rpcChannel!.stream.asBroadcastStream().transform(
          StreamTransformer.fromHandlers(
            handleData: (dynamic data, sink) => sink.add(data as Uint8List),
            handleError: (error, stackTrace, sink) => throw KrpcClientException('Client exception: $error'),
          )
        );
      }

      try {
        rpcChannel!.sink.add(EncodedProtobufs.getServerStatus());
        final rawResponse = await rpcStream!.first;
        final status = EncodedProtobufs.decodeStatusMessage(rawResponse);
        if (status.version == '0.4.8') {
          yield KrpcClientConnected();
        } else {
          yield KrpcClientError('Version mismatch! 0.4.8 was expected, it may not work!');
        }
      } on Exception catch(exception) {
        print(exception);
      }

    } else if (event is DisconnectRequest) {
      await _disconnectEverything();
      yield KrpcClientDisconnected();

    } else if (event is RpcRequest) {
      // todo TCP case when it works
      if (rpcChannel == null) {
        yield KrpcClientDisconnected();
      } else {
        rpcChannel!.sink.add(event.data);
        final response = await rpcStream!.first;
        yield KrpcClientRpcResponse(response);
      }
    }
  }

  String _buildWebSocketAddress(ConnectionParameters parameters) {
    final address = 'ws://${parameters.ip}:${parameters.port}/?name=${parameters.clientName}';
    print('WebSocketChannel address: $address');
    return address;
  }

  Future<void> _disconnectEverything() async {
    if (tcpSocket != null) {
      await tcpSocket!.close();
    tcpSocket = null;
    }
    if (rpcChannel != null) {
      await rpcChannel!.sink.close();
      rpcChannel = null;
      rpcStream = null;
    }
  }
}
