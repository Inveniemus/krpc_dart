import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'krpc_client.dart';
import '../proto/krpc.pb.dart' show
  Request, ProcedureCall, Services, Response, ProcedureResult;

/// This class handles protobuf messages, mainly by encoding or decoding them.
class ProtobufHandler {
  final KrpcClient _client;
  ProtobufHandler(this._client);

  /// Hard-coded Request used by the builder, while the API may not be already
  /// available.
  static Uint8List encodeServicesRequest() {
    var request = Request()
      ..calls.add(ProcedureCall()
        ..service = 'KRPC'
        ..procedure = 'GetServices');
    return request.writeToBuffer();
  }

  /// Hard-coded response decoder to get the Services proto object, while
  /// the API may not be already available.
  static Services decodeServicesResponse(Uint8List data) {
    var response = Response.fromBuffer(data);
    return Services.fromBuffer(response.results[0].value);
  }
}

String encodeClientId(Uint8List rawValue) {
  return base64Encode(rawValue);
}
