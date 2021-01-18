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
/// It supports both TCP and websocket protocols, but the default one is
class KrpcClient {
  String ip;
  int rpcPort;
  int streamPort;
  String clientName;
  ConnectionProtocol protocol;

  WebSocketChannel rpcChannel;
  Stream rpcBroadcastStream;
  WebSocketChannel streamChannel;

  KrpcClientStatus status = KrpcClientStatus.disconnected;

  KrpcClient(
      {String ip = 'localhost',
      int rpcPort = 50000,
      int streamPort = 50001,
      String clientName = 'krpc-dart',
      ConnectionProtocol protocol = ConnectionProtocol.websocket})
      : ip = ip,
        rpcPort = rpcPort,
        streamPort = streamPort,
        clientName = clientName,
        protocol = protocol;

  String get websocketRpcUrl => 'ws://$ip:$rpcPort/?name=$clientName';

  /// Connect to the RPC server with connection parameters.
  Future<void> connectRPC() async => _connectRPC();

  /// Connect to the Stream server with connection parameter and the clientId,
  /// provided by the server.
  Future<void> connectStream(String clientId) async => _connectStream(clientId);

  /// Disconnects everything, i.e. RPC and stream connections.
  Future<void> disconnect() async => _disconnect();

  /// This method sends an encoded RPC Request and wait for the Response to
  /// return it.
  Future<Uint8List> rpcCall(Uint8List encodedRequest) async => _rpcCall(encodedRequest);

  /// This method tests the web channel upon connection request by sending a
  /// kRPC server status request.
  Future<void> checkServerStatus() async {
    await rpcCall(ProtobufHandler.encodeStatusRequest());
  }

  Future<void> _connectRPC() async {
    status = KrpcClientStatus.connecting;
    print('Connecting to RPC WebSocket: $websocketRpcUrl');
    rpcChannel = IOWebSocketChannel.connect(websocketRpcUrl);
    rpcBroadcastStream = rpcChannel.stream.handleError((error) {
      status = KrpcClientStatus.error;
      throw KrpcConnectionError('Could not connect! '
          'Check ip and rpcPort values (we used $ip and $rpcPort)');
    }).asBroadcastStream();
    await checkServerStatus();
    status = KrpcClientStatus.connected;
  }

  Future<void> _connectStream(String clientId) async {
    var streamUrl = 'ws://$ip:$streamPort/?id=$clientId';
    print('Connecting to stream WebSocket: $streamUrl');
    streamChannel = IOWebSocketChannel.connect(streamUrl);
  }

  Future<void> _disconnect() async {
    if (streamChannel != null) {
      await streamChannel.sink.close();
    }
    if (rpcChannel != null) {
      await rpcChannel.sink.close();
    }
    status = KrpcClientStatus.disconnected;
  }

  Future<Uint8List> _rpcCall(Uint8List encodedRequest) async {
    rpcChannel.sink.add(encodedRequest);
    var encodedResponse = await rpcBroadcastStream.first;
    if (encodedResponse is Uint8List) return encodedResponse;
    throw KrpcConnectionError('Unexpected answer from the server!');
  }
}

enum KrpcClientStatus { disconnected, connecting, connected, error }

enum ConnectionProtocol { TCP, websocket }
