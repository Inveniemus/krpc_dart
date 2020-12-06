import 'dart:io';

import 'package:mustache_template/mustache.dart';

import '../../lib/proto/krpc.pb.dart' show Procedure;
import '../utils.dart';
import 'parameters_builder.dart';
import 'procedure_handler.dart';
import 'type_handler.dart';

/// This class builds a procedure for the Dart API, whatever its nature
class ProcedureBuilder {
  final Procedure procedure;
  final ProcedureHandler handler;

  ProcedureBuilder(this.procedure) : handler = ProcedureHandler(procedure);

  String _build() {
    Map<String, dynamic> templateData = {};
    Template template;

    // DEBUG STUFF - REMOVE
    Template debugTemplate = Template(
        File('./bin/builders/procedure_template_debug').readAsStringSync());
    Map<String, dynamic> debugData = {};
    debugData['procedure_name'] = procedure.name;
    debugData['return_type'] = typeAnalyzer(procedure.returnType);
    debugData['parameters'] = procedure.parameters.map((parameter) {
      return {
        'parameter_type': typeAnalyzer(parameter.type),
        'parameter_name': parameter.name,
      };
    });
    // ^DEBUG STUFF - REMOVE^

    if (handler.isGetter) {
      template = Template(
          File('./bin/builders/procedure_template_getter').readAsStringSync());
    } else if (handler.isSetter) {
      template = Template(
          File('./bin/builders/procedure_template_setter').readAsStringSync());
    } else {
      template = Template(
          File('./bin/builders/procedure_template').readAsStringSync());
    }

    templateData['documentation'] = parseDoc(procedure.documentation);
    templateData['return_type'] = TypeHandler(procedure.returnType).dartType;
    templateData['procedure_dart_name'] = handler.dartName;
    templateData['parameters'] = ParametersBuilder(procedure.parameters).toString();

    return debugTemplate.renderString(debugData) +
        '\n' +
        template.renderString(templateData);
  }

  @override
  String toString() => _build();
}
