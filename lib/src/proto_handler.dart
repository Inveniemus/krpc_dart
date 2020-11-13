import 'dart:convert';
import 'dart:typed_data';

import 'krpc_client.dart';
import '../proto/krpc.pb.dart' show Request, ProcedureCall;

/// This class handles protobuf messages, mainly by encoding or decoding them.
class ProtobufHandler {
  final KrpcClient _client;
  ProtobufHandler(this._client);
}

/// Pre-build class required before the library is built.
class ServicesRequest extends Request {
  factory ServicesRequest() {
    return Request()
      ..calls.add(ProcedureCall()
        ..service = 'KRPC'
        ..procedure = 'GetServices');
  }
}

/// Pre-build class required initially for testing
// todo: remove it when KRPC Services are available from the builder.
class ClientIdRequest  extends Request {
  factory ClientIdRequest() {
    return Request()
      ..calls.add(ProcedureCall()
        ..service = 'KRPC'
        ..procedure = 'GetClientID');
  }
}

String encodeClientId(Uint8List rawValue) {
  return base64Encode(rawValue);
}
