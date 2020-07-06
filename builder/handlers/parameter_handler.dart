import 'dart:typed_data';

import '../proto/krpc.pb.dart';
import 'type_handler.dart';

class ParameterHandler {
  final Parameter _parameter;
  ParameterHandler(this._parameter);

  String get name => _parameter.name;
  String get dartTypeString => TypeHandler(_parameter.type).dartTypeString;
  String get krpcTypeString => TypeHandler(_parameter.type).krpcTypeString;

  Uint8List get defaultValue => _parameter.defaultValue;
}