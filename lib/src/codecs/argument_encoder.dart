import 'dart:typed_data';

import 'package:fixnum/fixnum.dart';
import 'package:protobuf/protobuf.dart';

import '../../proto/krpc.pb.dart' show Argument, EnumerationValue;

class ArgumentEncoder {
  final Map<String, dynamic> parameterMetaData;

  ArgumentEncoder(this.parameterMetaData);

  Argument encode() {
    Argument argument = Argument();
    argument.position = parameterMetaData['position'];

    CodedBufferWriter writer = CodedBufferWriter();

    switch (parameterMetaData['type_code']) {
      case 'NONE':
        // NOT RELEVANT
        break;
      case 'DOUBLE':
        writer.writeField(1, PbFieldType.OD, parameterMetaData['name']);
        break;
      case 'FLOAT':
        writer.writeField(1, PbFieldType.OF, parameterMetaData['name']);
        break;
      case 'SINT32':
        writer.writeField(1, PbFieldType.OS3, parameterMetaData['name']);
        break;
      case 'SINT64':
        writer.writeField(1, PbFieldType.OS6, parameterMetaData['name']);
        break;
      case 'UINT32':
        writer.writeField(1, PbFieldType.OU3, parameterMetaData['name']);
        break;
      case 'UINT64':
        writer.writeField(1, PbFieldType.OU6, parameterMetaData['name']);
        break;
      case 'BOOL':
        writer.writeField(1, PbFieldType.OB, parameterMetaData['name']);
        break;
      case 'STRING':
        writer.writeField(1, PbFieldType.OS, parameterMetaData['name']);
        break;
      case 'BYTES':
        writer.writeField(1, PbFieldType.OY, parameterMetaData['name']);
        break;
      case 'CLASS':
        dynamic ref = parameterMetaData['name'];
        if (ref is! Int64) ref = ref.ref;
        writer.writeField(1, PbFieldType.OU6, ref);
        break;
      case 'ENUMERATION':
        writer.writeField(1, PbFieldType.OS3, parameterMetaData['name']);
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
        // NOT RELEVANT
        break;
      case 'SERVICES':
        // NOT RELEVANT
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

    var buffer = writer.toBuffer();
    buffer = buffer.sublist(1);
    argument.value = buffer;

    return argument;
  }
}
