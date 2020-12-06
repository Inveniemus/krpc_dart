import '../../lib/proto/krpc.pb.dart' show Type, Type_TypeCode;

/// This class handles a kRPC type, that may contain a collection of types,
/// and/or be a collection itself.
class TypeHandler {
  final Type type;
  String dartType;
  TypeHandler(this.type) {
    _analyze();
  }

  void _analyze() {
    switch(type.code) {
      case Type_TypeCode.NONE:
        dartType = 'void';
        break;
      case Type_TypeCode.DOUBLE:
        dartType = 'double';
        break;
      case Type_TypeCode.FLOAT:
        dartType = 'double';
        break;
      case Type_TypeCode.SINT32:
        dartType = 'int';
        break;
      case Type_TypeCode.SINT64:
        dartType = 'int';
        break;
      case Type_TypeCode.UINT32:
        dartType = 'int';
        break;
      case Type_TypeCode.UINT64:
        dartType = 'int';
        break;
      case Type_TypeCode.BOOL:
        dartType = 'bool';
        break;
      case Type_TypeCode.STRING:
        dartType = 'String';
        break;
      case Type_TypeCode.BYTES:
        dartType = 'Uint8List';
        break;
      case Type_TypeCode.CLASS:
        dartType = type.name;
        break;
      case Type_TypeCode.ENUMERATION:
        dartType = type.name;
        break;
      case Type_TypeCode.EVENT:
      case Type_TypeCode.PROCEDURE_CALL:
      case Type_TypeCode.STREAM:
      case Type_TypeCode.STATUS:
        dartType = 'Status';
        break;
      case Type_TypeCode.SERVICES:
        dartType = 'Services';
        break;
      case Type_TypeCode.TUPLE:
      case Type_TypeCode.LIST:
      case Type_TypeCode.SET:
      case Type_TypeCode.DICTIONARY:
    }
  }
}

class UnimplementedTypeException implements Exception {
  final String typeName;
  UnimplementedTypeException(this.typeName);

  @override
  String toString() => 'Unimplemented type exception: $typeName';
}