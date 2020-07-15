import 'dart:convert';
import 'dart:typed_data';
import 'dart:mirrors';

import 'package:krpc_dart/exceptions.dart';
import 'package:krpc_dart/proto/krpc.pb.dart'
    show Request, ProcedureCall, Argument, Response, Type, Type_TypeCode, Status, EnumerationValue;
import 'package:protobuf/protobuf.dart';

class Coder {
  /// Request encoder from [dataList] map that should follow the following
  /// structure, derived from the protobuf Request message structure:
  /// {'service': <service name, as string>,
  ///  'procedure': <procedure name, as string>,
  ///  'serviceId': <service id, as int>,
  ///  'procedureId': <procedure id, as int>,
  ///  'arguments': [
  ///    {'position': <argument's position, as int>,
  ///     'value': <value, as any type it may have>,
  ///  ],
  /// }
  static Uint8List encodeSingleRequest(Map<String, dynamic> data) {
    var request = Request();
    var call = ProcedureCall();
    request.calls.add(call);

    if (data.containsKey('service') && data['service'] is String) {
      call.service = data['service'];
    } else if (data.containsKey('serviceId') && data['serviceId'] is int) {
      call.serviceId = data['serviceId'];
    } else {
      throw KrpcErrorEncoder(
          'Encoder error: No service nor serviceID provided!');
    }

    if (data.containsKey('procedure') && data['procedure'] is String) {
      call.procedure = data['procedure'];
    } else if (data.containsKey('procedureId') && data['procedureId'] is int) {
      call.procedureId = data['procedureId'];
    } else {
      throw KrpcErrorEncoder(
          'Encoder error: No procedure nor procedureId provided!');
    }

    if (data.containsKey('krpc_arguments')) {
      var arguments = data['krpc_arguments'];
      arguments.forEach((argumentData) {
        var argument = _buildArgument(argumentData);
        call.arguments.add(argument);
      });
    }
    return request.writeToBuffer();
  }

  /// To decode a single protobuf ProcedureResult message included in a Response
  ///
  /// It needs a [response] to manage errors sent by kRPC and to extract payload,
  /// and return value context to decode it properly and return the expected
  /// Dart type and value. [typeCode] is mandatory for that purpose. If we need
  /// more details about the return value to decoded it properly, we use
  /// optional parameters [typeName] and [serviceNameSnakeCase] (for Classes,
  /// Enumerations, Status, etc.).
  static dynamic decodeSingleResponse(
      Response response, String typeCode,
      [String typeName, String serviceNameSnakeCase]) {
    if (response.error.name != '') {
      throw KrpcErrorResponse(response.error.name + response.error.description);
    }
    var result = response.results[0];
    if (result.error.name != '') {
      throw KrpcErrorProcedureResult(
          result.error.name + result.error.description);
    }
    var valueDecoded = _valueDecoder(
        Uint8List.fromList(result.value), typeCode, typeName, serviceNameSnakeCase);
    print(valueDecoded);
    return valueDecoded;
  }

  static dynamic _valueDecoder(
      Uint8List value, String typeCode,
      [String typeName, String serviceNameSnakeCase]) {

    print('Value decoder:\nValue (raw): ${value}\nType: ${typeCode}');

    // When krpc cannot find requested stuff, value will be an empty list
    if (value.isEmpty) return null;

    var reader = CodedBufferReader(value);

    var library;
    if (serviceNameSnakeCase != null) {
      var librarySymbol = Symbol(serviceNameSnakeCase);
      library = currentMirrorSystem().findLibrary(librarySymbol);
    }

    switch(typeCode) {
      case 'NONE':
        return null;
      case 'DOUBLE':
        return reader.readDouble();
      case 'FLOAT':
        return reader.readFloat();
      case 'SINT32':
        return reader.readSfixed32();
      case 'SINT64':
        return reader.readSint64();
      case 'UINT32':
        return reader.readUint32();
      case 'UINT64':
        return reader.readUint64();
      case 'BOOL':
        return reader.readBool();
      case 'STRING':
        return reader.readString();
      case 'BYTES':
        return value;
      case 'CLASS':
        print('${typeCode} name: ${typeName}');
        var classSymbol = MirrorSystem.getSymbol(typeName);
        ClassMirror classMirror = library.declarations[classSymbol];
        return classMirror.newInstance(Symbol(''), [null, value], {}).reflectee;
      case 'ENUMERATION':
        print('${typeCode} name: ${typeName}');
        var classSymbol = MirrorSystem.getSymbol(typeName);
        ClassMirror classMirror = library.declarations[classSymbol];
        var indexNumber = reader.readEnum() ~/ 2; // Divided by 2 for whatever reason, I don't know why.
        var symbolName = classMirror.declarations.keys.elementAt(indexNumber + 3); // Very dirty.
        return classMirror.getField(symbolName).reflectee;

    // todo: the following 4 to be investigated
      case 'PROCEDURE_CALL':
        return ProcedureCall.fromBuffer(value);
      case 'STREAM':
        return 'Stream';
      case 'STATUS':
        return Status.fromBuffer(value); // OK
      case 'SERVICES':
        return 'dynamic';

    // todo: to be confirmed
      case 'TUPLE':
        return 'List<dynamic>';
      case 'LIST':
        return 'List<dynamic>';
      case 'SET':
        return 'List<dynamic>';
      case 'DICTIONARY':
        return 'Map<String, dynamic>';

      default:
        return 'void';
    }
  }

  static Argument _buildArgument(Map<String, dynamic> data) {

    var argument = Argument();
    argument.position = data['position'];

    var writer = CodedBufferWriter();

    switch(data['type']) {
      case 'BOOL':
        //data['value'] ? argument.value = [1] : argument.value = [0];
        writer.writeField(1, PbFieldType.OB, data['value']);
        break;
      case 'DOUBLE':
        writer.writeField(1, PbFieldType.OD, data['value']);
        break;
      case 'FLOAT':
        writer.writeField(1, PbFieldType.OF, data['value']);
        break;
      case 'SINT32':
        writer.writeField(1, PbFieldType.KS3, data['value']);
        break;
      case 'SINT64':
        writer.writeField(1, PbFieldType.KS6, data['value']);
        break;
      case 'UINT32':
        writer.writeField(1, PbFieldType.KU3, data['value']);
        break;
      case 'UINT64':
        writer.writeField(1, PbFieldType.KU6, data['value']);
        break;
      case 'STRING':
        writer.writeField(1, PbFieldType.OS, data['value']);
        break;
      case 'BYTES':
        argument.value = data['value'];
        return argument;
    }

    var buffer = writer.toBuffer();
    buffer = buffer.sublist(1);
    argument.value = buffer;

    return argument;
  }
}