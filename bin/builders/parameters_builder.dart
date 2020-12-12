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
    for (int i = 0; i < parameters.length; i++) {
      String nameValue = parameters[i].name;
      if (nameValue == 'this') nameValue = 'ref';
      result += "{'position': $i, 'type_code': '${parameters[i].type.code}', 'type_name': '${parameters[i].type.name}', 'name': $nameValue}, ";
    }
    return result;
  }
}