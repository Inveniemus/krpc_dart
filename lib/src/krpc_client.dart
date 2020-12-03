import 'dart:async';
import 'dart:typed_data';

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
  final String ip;
  final int rpcPort;
  final int streamPort;
  final String clientName;

  WebSocketChannel rpcChannel;
  Stream rpcBroadcastStream;
  WebSocketChannel streamChannel;

  KrpcClient(
      {String ip = 'localhost',
      int rpcPort = 50000,
      int streamPort = 50001,
      String clientName = 'krpc-dart'})
      : ip = ip,
        rpcPort = rpcPort,
        streamPort = streamPort,
        clientName = clientName;

  /// Connect to the RPC server with connection parameter.
  Future<void> connectRPC() async {
    var rpcUrl = 'ws://$ip:$rpcPort/?name=$clientName';
    print('Connecting to RPC WebSocket: $rpcUrl');
    rpcChannel = IOWebSocketChannel.connect(rpcUrl);
    rpcBroadcastStream = rpcChannel.stream.handleError((error) {
      throw KrpcConnectionError(
          'Could not connect! '
          'Check ip and rpcPort values (we used $ip and $rpcPort)');
    }).asBroadcastStream();
  }

  Future<void> disconnect() async {
    if (streamChannel != null) {
      await streamChannel.sink.close();
    }
    if (rpcChannel != null) {
      await rpcChannel.sink.close();
    }
  }

  /// Connect to the Stream server with connection parameter and the clientId,
  /// provided by the server.
  Future<void> connectStream(String clientId) async {
    var streamUrl = 'ws://$ip:$streamPort/?id=$clientId';
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
}
