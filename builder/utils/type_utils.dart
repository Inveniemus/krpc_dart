/// This file provide type related conversion from kRPC types to Dart types.

import '../proto/krpc.pb.dart' show Type;

String convert(Type type) {
  switch(type.code.name) {
    case 'DOUBLE':
      return 'double';
      break;
    case 'FLOAT':
      return 'double';
      break;
    case 'SINT32':
      return 'int';
      break;
    case 'SINT64':
      return 'int';
      break;
    case 'UINT32':
      return 'int';
      break;
    case 'UINT64':
      return 'int';
      break;
    case 'BOOL':
      return 'bool';
      break;
    case 'STRING':
      return 'String';
      break;
    case 'BYTES':
      return 'Uint8List';
      break;
    case 'CLASS':
      return type.name;
      break;
    case 'ENUMERATION':
      return type.name;
      break;

      // todo: the following 4 to be investigated
    case 'PROCEDURE_CALL':
      return 'Function';
      break;
    case 'STREAM':
      return 'Stream';
      break;
    case 'STATUS':
      return 'dynamic';
      break;
    case 'SERVICES':
      return 'dynamic';
      break;

    // todo: to be confirmed
    case 'TUPLE':
      return 'List<dynamic>';
      break;
    case 'LIST':
      return 'List<dynamic>';
      break;
    case 'SET':
      return 'List<dynamic>';
      break;
    case 'DICTIONARY':
      return 'Map<String, dynamic>';
      break;

    default:
      return 'void';
  }
}