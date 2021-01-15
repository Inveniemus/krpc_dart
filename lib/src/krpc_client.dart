import 'dart:async';
import 'dart:typed_data';

import 'package:krpc_dart/krpc_dart.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'exceptions.dart';

/// The client to connect to the kRPC server inside KSP
///
/// It is responsible to send and receive protobuf data RPCs and streams.
/// It can request the necessary "kRPC services" to build the library.
/// It has to be referenced by the library generated objects, in order to call
/// their methods (a.k.a as Procedure in kRPC nomenclature).
class KrpcClient {
  String _ip;
  int _rpcPort;
  int _streamPort;
  String _clientName;

  WebSocketChannel rpcChannel;
  Stream rpcBroadcastStream;
  WebSocketChannel streamChannel;

  KrpcClientStatus status = KrpcClientStatus.disconnected;

  KrpcClient({String ip = 'localhost',
    int rpcPort = 50000,
    int streamPort = 50001,
    String clientName = 'krpc-dart'})
      : _ip = ip,
        _rpcPort = rpcPort,
        _streamPort = streamPort,
        _clientName = clientName;

  void set ip(String input) {
    if (input == 'localhost') _ip = input;
    final ipRE = RegExp(r'\d+\.\d+\.\d+\.\d+');
    if (ipRE.hasMatch(input)) {
      _ip = input;
    } else {
      // Nothing. _ip is unchanged in the case of a wrong value.
    }
  }

  String get rpcUrl => 'ws://$_ip:$_rpcPort/?name=$_clientName';

  void set rpcPort(int number) => _rpcPort = number;

  void set streamPort(int number) => _streamPort = number;

  void set clientName(String input) => _clientName = input;

  /// Connect to the RPC server with connection parameter.
  Future<void> connectRPC() async {
    status = KrpcClientStatus.connecting;
    print('Connecting to RPC WebSocket: $rpcUrl');
    rpcChannel = IOWebSocketChannel.connect(rpcUrl);
    rpcBroadcastStream = rpcChannel.stream.handleError((error) {
      status = KrpcClientStatus.error;
      throw KrpcConnectionError(
          'Could not connect! '
              'Check ip and rpcPort values (we used $_ip and $_rpcPort)');
    }).asBroadcastStream();
    await checkServerStatus();
    status = KrpcClientStatus.connected;
  }

  /// Disconnects everything, i.e. RPC and stream connections.
  Future<void> disconnect() async {
    if (streamChannel != null) {
      await streamChannel.sink.close();
    }
    if (rpcChannel != null) {
      await rpcChannel.sink.close();
    }
    status = KrpcClientStatus.disconnected;
  }

  /// Connect to the Stream server with connection parameter and the clientId,
  /// provided by the server.
  Future<void> connectStream(String clientId) async {
    var streamUrl = 'ws://$_ip:$_streamPort/?id=$clientId';
    print('Connecting to stream WebSocket: $streamUrl');
    streamChannel = IOWebSocketChannel.connect(streamUrl);
  }

  /// This method sends an encoded RPC Request and wait for the Response to
  /// return it.
  Future<Uint8List> rpcCall(Uint8List encodedRequest) async {
    rpcChannel.sink.add(encodedRequest);
    var encodedResponse = await rpcBroadcastStream.first;
    if (encodedResponse is Uint8List) return encodedResponse;
    throw KrpcConnectionError('Unexpected answer from the server!');
  }

  /// This method tests the web channel upon connection request by sending a
  /// kRPC server status request.
  Future<void> checkServerStatus() async {
    await rpcCall(ProtobufHandler.encodeStatusRequest());
  }

  // TESTING STUFF______________________________________________________________
  void replaceRpcChannel(WebSocketChannel newRpcChannel) {
    rpcChannel = newRpcChannel;
  }
}

enum KrpcClientStatus {
  disconnected,
  connecting,
  connected,
  error
}
