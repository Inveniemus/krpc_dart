import 'dart:async';
import 'dart:typed_data';

import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../proto/krpc.pb.dart' show Request, ProcedureCall, Services, Response;
import 'proto_handler.dart';

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
    rpcBroadcastStream = rpcChannel.stream.asBroadcastStream();
  }

  /// Connect to the Stream server with connection parameter and the clientId,
  /// provided by the server.
  Future<void> connectStream(String clientId) async {
    var streamUrl = 'ws://$ip:$streamPort/?id=$clientId';
    print('Connecting to stream WebSocket: $streamUrl');
    streamChannel = IOWebSocketChannel.connect(streamUrl);

    // todo: remove this
    print('Getting the kRPC Services...');
    var encodedServices = await rpcCall(
        ServicesRequest().writeToBuffer());
    print('Services available!');
    var response = decodeResponse(encodedServices);
    var result = response.results.first;
    var services = Services.fromBuffer(result.value);
    print(services.services.length);
  }

  /// This method sends an encoded RPC Request and wait for the Response to
  /// return it.
  Future<Uint8List> rpcCall(Uint8List encodedRequest) async {
    rpcChannel.sink.add(encodedRequest);
    var encodedResponse = await rpcBroadcastStream.first;
    if (encodedResponse is Uint8List) return encodedResponse;
    return null; // It cannot reach here, normally...
  }
}

/// Manually built protobuf encoded message for getting the client ID
/// of the client in the server. It is used to open the connection to the stream
/// server. It is available here as the library may not have been built yet.
Uint8List getClientIdMessage() {
  var request = Request()
    ..calls.add(ProcedureCall()
      ..service = 'KRPC'
      ..procedure = 'GetClientID');
  return request.writeToBuffer();
}

/// Create the Response object of krpc.pb.dart out of received raw data.
/// Made very easy by the proto file generated.
Response decodeResponse(Uint8List encodedData) {
  return Response.fromBuffer(encodedData);
}
