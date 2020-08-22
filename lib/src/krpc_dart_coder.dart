import 'dart:typed_data';
import 'dart:mirrors';

import 'package:krpc_dart/src/krpc_dart_call_handler.dart';
import 'package:krpc_dart/src/krpc_dart_client.dart' show Client;
import 'package:krpc_dart/exceptions.dart';
import 'package:krpc_dart/proto/krpc.pb.dart'
    show Request, ProcedureCall, Argument, Response, Type, Type_TypeCode, Status, EnumerationValue;
import 'package:protobuf/protobuf.dart';

import '../krpc_dart.dart';

class Coder {

  final Client _client;
  String expectedKrpcReturnType;
  String expectedDartReturnType;
  String expectedLibraryName;

  Coder(this._client);

  Uint8List encodeCall(CallMetaData metaData) {
    var call = ProcedureCall();
    call.service = metaData.serviceName;
    call.procedure = metaData.procedureName;
    expectedKrpcReturnType = metaData.krpcReturnType;

    return call.writeToBuffer();
  }

  Uint8List encodeCallAsSingleRequest(CallMetaData metaData) {

    // Initial set-up of the request
    var request = Request();
    var call = ProcedureCall();
    call.service = metaData.serviceName;
    call.procedure = metaData.procedureName;

    // Addition of the instance's reference if relevant
    if (metaData.classReference != null) {
      call.arguments.add(
        Argument()
            ..position = 0
            ..value = metaData.classReference
      );
    }
    metaData.argumentsMetaData.forEach((argumentMetaData) {
      call.arguments.add(_buildArgument(argumentMetaData));
    });
    request.calls.add(call);

    expectedKrpcReturnType = metaData.krpcReturnType;
    expectedDartReturnType = metaData.dartReturnType;
    expectedLibraryName = metaData.libraryName;

    return request.writeToBuffer();
  }

  dynamic decodeResponse(Uint8List data) {

    var response = Response.fromBuffer(data);
    // TODO : kRPC errors handling

    var result = response.results[0];
    // TODO : kRPC errors handling

    return _valueDecoder(Uint8List.fromList(result.value));
  }

  dynamic _valueDecoder(Uint8List value) {

    print('Value decoder: Value (raw): ${value} Type: ${expectedKrpcReturnType}');

    // When krpc cannot find requested stuff, value will be an empty list
    if (value.isEmpty) return null;

    var reader = CodedBufferReader(value);

    var library;
    if (expectedLibraryName != null) {
      var librarySymbol = Symbol(expectedLibraryName);
      library = currentMirrorSystem().findLibrary(librarySymbol);
    }

    switch(expectedKrpcReturnType) {
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
        print('${expectedKrpcReturnType} name: ${expectedDartReturnType}');
        var classSymbol = MirrorSystem.getSymbol(expectedDartReturnType);
        ClassMirror classMirror = library.declarations[classSymbol];
        return classMirror.newInstance(Symbol(''), [_client, value], {}).reflectee;
      case 'ENUMERATION':
        print('${expectedKrpcReturnType} name: ${expectedDartReturnType}');
        var classSymbol = MirrorSystem.getSymbol(expectedDartReturnType);
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

  static Argument _buildArgument(ArgumentMetaData metaData) {

    var argument = Argument();
    argument.position = metaData.position;

    var writer = CodedBufferWriter();

    switch(metaData.krpcType) {
      case 'BOOL':
        //data['value'] ? argument.value = [1] : argument.value = [0];
        writer.writeField(1, PbFieldType.OB, metaData.value);
        break;
      case 'DOUBLE':
        writer.writeField(1, PbFieldType.OD, metaData.value);
        break;
      case 'FLOAT':
        writer.writeField(1, PbFieldType.OF, metaData.value);
        break;
      case 'SINT32':
        writer.writeField(1, PbFieldType.KS3, metaData.value);
        break;
      case 'SINT64':
        writer.writeField(1, PbFieldType.KS6, metaData.value);
        break;
      case 'UINT32':
        writer.writeField(1, PbFieldType.KU3, metaData.value);
        break;
      case 'UINT64':
        writer.writeField(1, PbFieldType.KU6, metaData.value);
        break;
      case 'STRING':
        writer.writeField(1, PbFieldType.OS, metaData.value);
        break;
      case 'BYTES':
        argument.value = metaData.value;
        return argument;
    }

    var buffer = writer.toBuffer();
    buffer = buffer.sublist(1);
    argument.value = buffer;

    return argument;
  }
}