import 'dart:io';

import '../../lib/proto/krpc.pb.dart';
import 'package:mustache_template/mustache_template.dart';

import '../utils.dart';
import 'procedure_builder.dart';
import 'procedure_handler.dart';

/// Builds the Service library file content, accessed by a call to toString().
class ServiceBuilder {
  final Service service;
  Template template;

  ServiceBuilder(this.service) {
    template =
        Template(File('./bin/builders/service_template').readAsStringSync());
  }

  String _build() {
    Map<String, dynamic> templateData = {};

    // Service
    templateData['library_name'] = service.name;
    templateData['documentation'] = parseDoc(service.documentation);

    // Service Procedures
    templateData['service_procedures'] = [];
    for (final procedure in service.procedures) {
      final builder = ProcedureBuilder(procedure);
      if (builder.handler.isService) {
        templateData['service_procedures'].add({
          'procedure_dart': builder.toString(),
        });
      }
    }

    // Service Classes
    templateData['classes'] = [];
    for (final _class in service.classes) {
      templateData['classes'].add({
        'class_name': _class.name,
        'class_documentation': parseDoc(_class.documentation),
        'class_procedures': service.procedures.where((procedure) {
          return ProcedureHandler(procedure).className == _class.name;
        }).map((procedure) =>
            {'procedure_dart': ProcedureBuilder(procedure).toString()}),
      });
    }

    // Service Enumerations
    templateData['enumerations'] = [];
    for (final enumeration in service.enumerations) {
      templateData['enumerations'].add({
        'enumeration_name': enumeration.name,
        'enumeration_documentation': parseDoc(enumeration.documentation),
        'enumeration_values': enumeration.values.map(
          (enumeration_value) =>
              {'enumeration_value_name': toCamelCase(enumeration_value.name)},
        ),
      });
    }

    // Service Exceptions
    templateData['exceptions'] = [];
    for (final exception in service.exceptions) {
      templateData['exceptions'].add({
        'exception_name': exception.name,
        'exception_documentation': parseDoc(exception.documentation),
      });
    }

    return template.renderString(templateData);
  }

  @override
  String toString() => _build();
}
