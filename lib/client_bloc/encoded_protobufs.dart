import 'dart:typed_data';

import 'package:krpc_dart/proto/krpc.pb.dart';

class EncodedProtobufs {
  // ENCODERS
  static Uint8List tcpConnectionRequest(
      {String clientName = 'krpc_dart client'}) {
    final connectionRequest = ConnectionRequest()
      ..type = ConnectionRequest_Type.RPC
      ..clientName = clientName;
    return connectionRequest.writeToBuffer();
  }

  static Uint8List getServerStatus() {
    final request = Request()
      ..calls.add(ProcedureCall()
        ..service = 'KRPC'
        ..procedure = 'GetStatus');
    return request.writeToBuffer();
  }

  // DECODERS
  static ConnectionResponse decodeTcpConnectionResponse(Uint8List data) {
    return ConnectionResponse.fromBuffer(data.toList());
  }

  static Status decodeStatusMessage(Uint8List data) {
    return Status.fromBuffer(data);
  }
}
