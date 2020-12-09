import 'dart:typed_data';

import '../../lib/proto/krpc.pb.dart';
import 'type_handler.dart';

class ParametersBuilder {
  final List<Parameter> parameters;
  final bool isClass;
  ParametersBuilder(this.parameters, {this.isClass = false});

  String toDartString() {
    String result = '';
    for (final parameter in parameters) {
      // todo: default value parameters
      if (parameter.name != 'this') {
        result += '${TypeHandler(parameter.type).dartType} ${parameter.name}, ';
      }
    }
    if (result.endsWith(', ')) {
      result = result.substring(0, result.length - 2);
    }
    return result;
  }

  String toMetaDataString() {
    String result = '';
    // If classRef is not null:
    if (isClass) result += "{'class_ref': ref}, ";
    return result;
  }
}