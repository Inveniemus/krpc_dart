import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data' show Uint8List;

import 'package:meta/meta.dart';

import '../proto/krpc.pb.dart'
    show Request, ProcedureCall, Services, Response, ProcedureResult, Status;

/// This class handles protobuf messages, mainly by encoding or decoding them.
class ProtobufHandler {
  /// Hard-coded Request used by the builder, while the API may not already be
  /// available.
  static Uint8List encodeServicesRequest() {
    var request = Request()
      ..calls.add(ProcedureCall()
        ..service = 'KRPC'
        ..procedure = 'GetServices');
    return request.writeToBuffer();
  }

  /// Hard-coded response decoder to get the Services proto object, while
  /// the API may not already be available.
  static Services decodeServicesResponse(Uint8List data) {
    var response = Response.fromBuffer(data);
    return Services.fromBuffer(response.results[0].value);
  }

  /// Encode a request into a list of ints, out of a list of ProcedureCalls
  static Uint8List encodeRequest(List<ProcedureCall> calls) {
    final request = Request();
    request.calls.addAll(calls);
    return request.writeToBuffer();
  }

  static ProcedureCall procedureCallBuilder(
      {@required String service, @required String procedure}) {
    final procedureCall = ProcedureCall();
    procedureCall.service = service;
    procedureCall.procedure = procedure;
    return procedureCall;
  }

  static List<ProcedureResult> responseResultsBuilder(Uint8List data) {
    final response = Response.fromBuffer(data);
    if (response.hasField(1)) {
      // todo: Error handling of response errors sent by the kRPC server
      throw Exception('kRPC server error received (NOT IMPLEMENTED)');
    } else {
      return response.results;
    }
  }

  static Uint8List getProcedureResultData(ProcedureResult result) {
    if (result.hasField(1)) {
      // todo: Error handling of result errors sent by the kRPC server
      throw Exception('kRPC server error on result received (NOT IMPLEMENTED)');
    } else {
      return result.value;
    }
  }
}

// LOW-LEVEL HANDLERS

String encodeClientId(Uint8List rawValue) {
  return base64Encode(rawValue);
}

String getVersionFromRawStatus(Uint8List data) {
  return Status.fromBuffer(data).version;
}

String getServicesJsonString(Uint8List data) {
  return Services.fromBuffer(data).writeToJson();
}
