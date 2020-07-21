import '../proto/krpc.pb.dart' show Type;

/// This is the handler of the kRPC "Type" protobuf generated message, once
/// converted to Dart as the Type class (beware of name collisions, btw).
class TypeHandler {
  final Type _type;

  TypeHandler(this._type);

  Type get type => _type;

  String get dartTypeString {
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
        return 'Int64';
        break;
      case 'UINT32':
        return 'int';
        break;
      case 'UINT64':
        return 'Int64';
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
        return 'dynamic'; // This is actually a Status object, see protobuf generated file
        break;
      case 'SERVICES':
        return 'dynamic'; // This is actually a Service object, see protobuf generated file
        break;

    // todo: to be confirmed
      case 'TUPLE':
        return 'List<dynamic>';
        break;
      case 'LIST':
        var typeTxt = 'dynamic';
        var subTypeHandler = TypeHandler(_type.types[0]);
        print(subTypeHandler.toString());
        if (_type.types[0].name != '') typeTxt = _type.types[0].name;
        return 'List<${typeTxt}>';
        break;
      case 'SET':
        var typeTxt = 'dynamic';
        if (_type.types[0].name != '') typeTxt = _type.types[0].name;
        return 'List<${typeTxt}>';
        break;
      case 'DICTIONARY':
        return 'Map<String, dynamic>';
        break;

      default:
        return 'void';
    }
  }
  String get krpcTypeString => _type.code.name;

  @override
  String toString() {
    return 'TYPE code: ${_type.code} name: ${_type.name} subTypes? ${_type.types.isEmpty ? 'NO' : 'YES'}';
  }
}