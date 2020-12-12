import 'dart:typed_data';

import 'package:protobuf/protobuf.dart';

import '../../proto/krpc.pb.dart' show Argument;

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
        // todo
        break;
      case 'FLOAT':
        // todo
        break;
      case 'SINT32':
        // todo
        break;
      case 'SINT64':
        // todo
        break;
      case 'UINT32':
        // todo
        break;
      case 'UINT64':
        // todo
        break;
      case 'BOOL':
        writer.writeField(1, PbFieldType.OB, parameterMetaData['name']);
        break;
      case 'STRING':
        // todo
        break;
      case 'BYTES':
        // todo
        break;
      case 'CLASS':
        writer.writeField(1, PbFieldType.OY, parameterMetaData['name']);
        break;
      case 'ENUMERATION':
        // todo
        break;
      case 'EVENT':
        // todo
        break;
      case 'PROCEDURE_CALL':
        // todo
        break;
      case 'STREAM':
        // todo
        break;
      case 'STATUS':
        // NOT RELEVANT
        break;
      case 'SERVICES':
        // NOT RELEVANT
        break;
      case 'TUPLE':
        // todo
        break;
      case 'LIST':
        // todo
        break;
      case 'SET':
        // todo
        break;
      case 'DICTIONARY':
        // todo
        break;
    }

    var buffer = writer.toBuffer();
    buffer = buffer.sublist(1);
    argument.value = buffer;

    return argument;
  }
}
