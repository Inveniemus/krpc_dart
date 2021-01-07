import 'dart:convert';
import 'dart:typed_data' show Uint8List;

import 'package:krpc_dart/krpc_dart.dart';
import 'package:meta/meta.dart';
import 'package:protobuf/protobuf.dart';

import '../api/services_api.dart';
import '../proto/krpc.pb.dart'
    show Request, ProcedureCall, Services, Response, ProcedureResult, Status;
import 'codecs/argument_encoder.dart';

/// This class handles protobuf messages, mainly by encoding or decoding them.
class ProtobufHandler {
  final Map<String, dynamic> callMetaData;

  ProtobufHandler(this.callMetaData);

  Uint8List encode() {
    final call = ProcedureCall();
    call.service = callMetaData['service_name'];
    call.procedure = callMetaData['procedure_name'];
    for (final parameterMetaData in callMetaData['parameters']) {
      call.arguments.add(ArgumentEncoder(parameterMetaData).encode());
    }

    print('Encoding metadata: $callMetaData');

    return encodeRequest([call]);
  }

  dynamic decode(Uint8List data) {
    final resultData = getProcedureResultData(responseResultsBuilder(data)[0]);
    return handleReturnData(callMetaData['return_type'], resultData);
  }

  // Static methods (can be used without building the API) _____________________

  /// Hard-coded Request used by the builder, while the API may not already be
  /// available.
  static Uint8List encodeServicesRequest() {
    var request = Request()
      ..calls.add(ProcedureCall()
        ..service = 'KRPC'
        ..procedure = 'GetServices');
    return request.writeToBuffer();
  }

  /// Hard-coded Request used by the builder, while the API may not already be
  /// available.
  static Uint8List encodeStatusRequest() {
    var request = Request()
      ..calls.add(ProcedureCall()
        ..service = 'KRPC'
        ..procedure = 'GetStatus');
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
    if (response.hasError()) {
      throw KrpcServerError(response.error.service, response.error.name,
          response.error.description, response.error.stackTrace);
    } else {
      return response.results;
    }
  }

  static Uint8List getProcedureResultData(ProcedureResult result) {
    if (result.hasError()) {
      throw KrpcServerError(result.error.service, result.error.name,
          result.error.description, result.error.stackTrace);
    } else {
      return Uint8List.fromList(result.value);
    }
  }

  static dynamic handleReturnData(
      Map<String, dynamic> returnTypeData, Uint8List data) {
    if (returnTypeData == null) return;

    print('Handling: $returnTypeData - $data');

    final buffer = CodedBufferReader(data);

    switch (returnTypeData['code']) {
      case 'NONE':
        return null;
        break;
      case 'DOUBLE':
        return buffer.readDouble();
        break;
      case 'FLOAT':
        return buffer.readFloat();
        break;
      case 'SINT32':
        return buffer.readFixed32();
        break;
      case 'SINT64':
        return buffer.readFixed64();
        break;
      case 'UINT32':
        return buffer.readUint32();
        break;
      case 'UINT64':
        return buffer.readUint64();
        break;
      case 'BOOL':
        return buffer.readBool();
        break;
      case 'STRING':
        return buffer.readString();
        break;
      case 'BYTES':
        return buffer.readBytes();
        break;
      case 'CLASS':
        return getClass(
            returnTypeData['service'], returnTypeData['name'], data);
        break;
      case 'ENUMERATION':
        final index = (data[0] / 2).round(); // <= For whatever reason...
        return getEnum(
            returnTypeData['service'], returnTypeData['name'], index);
        break;
      case 'EVENT':
        // todo
        throw UnimplementedError();
        break;
      case 'PROCEDURE_CALL':
        // todo
        throw UnimplementedError();
        break;
      case 'STREAM':
        // todo
        throw UnimplementedError();
        break;
      case 'STATUS':
        return Status.fromBuffer(data);
        break;
      case 'SERVICES':
        return Services.fromBuffer(data);
        break;
      case 'TUPLE':
        // todo
        throw UnimplementedError();
        break;
      case 'LIST':
        // todo
        throw UnimplementedError();
        break;
      case 'SET':
        // todo
        throw UnimplementedError();
        break;
      case 'DICTIONARY':
        // todo
        throw UnimplementedError();
        break;
    }

    return null;
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
