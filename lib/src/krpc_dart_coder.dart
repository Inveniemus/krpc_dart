import 'dart:typed_data';
import 'dart:mirrors';

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
    print('encoding...');
    var request = Request();
    var call = ProcedureCall();
    request.calls.add(call);

    if (data.containsKey('service') && data['service'] is String) {
      call.service = data['service'];
    } else if (data.containsKey('serviceId') && data['serviceId'] is int) {
      call.serviceId = data['serviceId'];
    } else {
      // todo: throw an exception
    }

    if (data.containsKey('procedure') && data['procedure'] is String) {
      call.procedure = data['procedure'];
    } else if (data.containsKey('procedureId') && data['procedureId'] is int) {
      call.procedureId = data['procedureId'];
    } else {
      // todo: throw an exception
    }

    if (data.containsKey('arguments')) {
      List<Map<String, dynamic>> arguments = data['arguments'];
      arguments
          .sort((argA, argB) => argA['position'].compareTo(argB['position']));
      arguments.forEach((argumentData) {
        var argument = Argument();
        argument.position = argumentData['position'];
        argument.value = argumentData['value'];
      });
    }

    return request.writeToBuffer();
  }

  static dynamic decodeSingleResponse(Response response, String typeCode, [String typeName]) {
    print('decoding...');
    if (response.error.name != '') {
      print(response.error.description);
      return null; // todo: Exception
    }
    var result = response.results[0];
    if (result.error.name != '') {
      print(response.error.description);
      return null; // todo: Exception
    }
    var valueDecoded = _valueDecoder(result.value, typeCode, typeName);
    print(valueDecoded);
    return valueDecoded;
  }

  static dynamic _valueDecoder(Uint8List value, String typeCode, [String typeName]) {

    print('Value decoder:\nValue (raw): ${value}\nType: ${typeCode}');
    var reader = CodedBufferReader(value);

    var mirrorSystem = currentMirrorSystem();
    var krpcLibraryMirror = mirrorSystem.findLibrary(Symbol('krpc'));
    var spaceCenterLibraryMirror = mirrorSystem.findLibrary(Symbol('space_center'));
    print(krpcLibraryMirror.declarations);

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
        ClassMirror classMirror = krpcLibraryMirror.declarations[classSymbol];
        classMirror = spaceCenterLibraryMirror.declarations[classSymbol];
        return classMirror.newInstance(Symbol(''), [null, value], {}).reflectee;
      case 'ENUMERATION':
        return;

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


  static Uint8List ClientIDRequest() {
    var request = Request();
    var call = ProcedureCall();
    request.calls.add(call);
    call.service = 'KRPC';
    call.procedure = 'GetClientID';
    return request.writeToBuffer();
  }
}