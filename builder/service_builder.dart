import 'dart:io' show File;
import 'package:mustache_template/mustache_template.dart';
import 'proto/krpc.pb.dart' show Service, Procedure, Parameter;
import 'utils/string_utils.dart';
import 'utils/type_utils.dart';

/// This class builds a Service. It provides a [Map<String, dynamic>] of its
/// service [data], and write a library file [outFile].
class ServiceBuilder {

  final Service _service;
  final _template = Template(File('builder/templates/services.html')
      .readAsStringSync());

  File outFile;
  Map<String, dynamic> data = {
    'service_name': '',
    'service_procedures': [],
    'classes': [],
    'enumerations': [],
    'exceptions': [],
    'documentation': ''
  };

  ServiceBuilder(this._service) {
    var filename = 'lib/src/services/${toSnakeCase(_service.name)}.dart';
    File(filename).createSync(recursive: true);
    outFile = File(filename);
  }

  void run() {
    data['service_name'] = _service.name;
    data['documentation'] = parseDoc(_service.documentation);

    _buildClasses();
    _buildEnumerations();
    _buildExceptions();
    _buildProcedures();

    outFile.writeAsStringSync(_template.renderString(data));
  }

  void _buildClasses() {

    _service.classes.forEach((element) {
      var classData = {
        'class_name': '',
        'class_methods': [],
        'class_static_methods': [],
        'class_getters': [],
        'class_setters': [],
        'documentation': '',
      };

      // todo: confirm we don't use toPascalCase, cause RCS and SAS classes
      var className = element.name;
      classData['class_name'] = className;
      classData['documentation'] = parseDoc(element.documentation);
      data['classes'].add(classData);
    });
  }

  void _buildEnumerations() {
    _service.enumerations.forEach((enumeration) {
      Map<String, dynamic> enumData;
      enumData = {
        'enumeration_name': toPascalCase(enumeration.name),
        'documentation': parseDoc(enumeration.documentation),
        'enumeration_values': [],
      };
      enumeration.values.sort((A, B) => A.value.compareTo(B.value));
      enumeration.values.forEach((value) => enumData['enumeration_values']
          .add({'enumeration_value': toScreamingCase(value.name)}));
      data['enumerations'].add(enumData);
    });
  }

  void _buildExceptions() {
    // To remove duplicates:
    var exceptionsList = _service.exceptions.toSet().toList();
    // Then build:
    exceptionsList.forEach((exception) {
      data['exceptions'].add({
        'exception_name': toPascalCase(exception.name),
        'documentation': parseDoc(exception.documentation),
      });
    });
  }

  void _buildProcedures() {
    var filteredProcedures = _parseProcedures(_service.procedures);

    // Service procedures which are Service class methods
    var serviceProcedures = filteredProcedures['service_procedures'];
    serviceProcedures.forEach((procedureData) {
      procedureData['procedure_name'] =
          toCamelCase(procedureData['procedure_name']);
      Procedure procedure = procedureData['procedure'];
      procedureData['return_type'] = convert(procedure.returnType);
      procedureData['parameters'] = _buildParameters(procedure.parameters);
      procedureData['documentation'] = parseDoc(procedure.documentation);
      procedureData['raw_doc'] = procedure.documentation;
    });
    data['service_procedures'] = serviceProcedures;

    // Service class getters
    var serviceGetters = filteredProcedures['service_getters'];
    serviceGetters.forEach((procedureData) {
      procedureData['procedure_name'] =
          toCamelCase(procedureData['procedure_name']);
      Procedure procedure = procedureData['procedure'];
      procedureData['return_type'] = convert(procedure.returnType);
      procedureData['documentation'] = parseDoc(procedure.documentation);
      procedureData['raw_doc'] = procedure.documentation;
    });
    data['service_getters'] = serviceGetters;

    // Service class setters
    var serviceSetters = filteredProcedures['service_setters'];
    serviceSetters.forEach((procedureData) {
      procedureData['procedure_name'] =
          toCamelCase(procedureData['procedure_name']);
      Procedure procedure = procedureData['procedure'];
      procedureData['parameters'] = _buildParameters(procedure.parameters);
      procedureData['documentation'] = parseDoc(procedure.documentation);
      procedureData['raw_doc'] = procedure.documentation;
    });
    data['service_setters'] = serviceSetters;

    // Class methods
    var classMethods = filteredProcedures['class_methods'];
    classMethods.forEach((procedureData) {
      procedureData['procedure_name'] =
          toCamelCase(procedureData['procedure_name']);
      Procedure procedure = procedureData['procedure'];
      procedureData['return_type'] = convert(procedure.returnType);
      procedureData['parameters'] = _buildParameters(procedure.parameters);
      procedureData['documentation'] = parseDoc(procedure.documentation);
      procedureData['raw_doc'] = procedure.documentation;

      var classData = data['classes'].firstWhere((classData) =>
        classData['class_name'] == procedureData['class_name']);
      classData['class_methods'].add(procedureData);
    });

    // Class static methods
    var staticClassMethods = filteredProcedures['class_static_methods'];
    staticClassMethods.forEach((procedureData) {
      procedureData['procedure_name'] =
          toCamelCase(procedureData['procedure_name']);
      Procedure procedure = procedureData['procedure'];
      procedureData['return_type'] = convert(procedure.returnType);
      procedureData['parameters'] = _buildParameters(procedure.parameters);
      procedureData['documentation'] = parseDoc(procedure.documentation);
      procedureData['raw_doc'] = procedure.documentation;

      var classData = data['classes'].firstWhere((classData) =>
      classData['class_name'] == procedureData['class_name']);
      classData['class_static_methods'].add(procedureData);
    });

    // Class getters
    var gettersMethods = filteredProcedures['class_getters'];
    gettersMethods.forEach((procedureData) {
      procedureData['procedure_name'] =
          toCamelCase(procedureData['procedure_name']);
      Procedure procedure = procedureData['procedure'];
      procedureData['return_type'] = convert(procedure.returnType);
      procedureData['documentation'] = parseDoc(procedure.documentation);
      procedureData['raw_doc'] = procedure.documentation;
      
      var classData = data['classes'].firstWhere((classData) =>
      classData['class_name'] == procedureData['class_name']);
      classData['class_getters'].add(procedureData);
    });
    
    // Class setters
    var settersMethods = filteredProcedures['class_setters'];
    settersMethods.forEach((procedureData) {
      procedureData['procedure_name'] =
          toCamelCase(procedureData['procedure_name']);
      Procedure procedure = procedureData['procedure'];
      procedureData['parameters'] = _buildParameters(procedure.parameters);
      procedureData['documentation'] = parseDoc(procedure.documentation);
      procedureData['raw_doc'] = procedure.documentation;

      var classData = data['classes'].firstWhere((classData) =>
      classData['class_name'] == procedureData['class_name']);
      classData['class_setters'].add(procedureData);
    });
  }

  static Map<String, dynamic> _parseProcedures(List<Procedure> procedures) {

    var result = {
      'service_procedures': [],
      'service_getters': [],
      'service_setters': [],
      'class_methods': [],
      'class_static_methods': [],
      'class_getters': [],
      'class_setters': [],
    };

    var serviceProcedureRE = RegExp(r'^[A-Za-z]+$');
    var serviceGetterProcedureRE = RegExp(r'^get_([A-Za-z]+)$');
    var serviceSetterProcedureRE = RegExp(r'^set_([A-Za-z]+)$');
    var classMethodProcedureRE = RegExp(r'^([A-Za-z]+)_([A-Za-z]+)$');
    var classStaticMethodProcedureRE =
    RegExp(r'^([A-Za-z]+)_static_([A-Za-z]+)$');
    var classGetterMethodProcedureRE = RegExp(r'^([A-Za-z]+)_get_([A-Za-z]+)$');
    var classSetterMethodProcedureRE = RegExp(r'^([A-Za-z]+)_set_([A-Za-z]+)$');


    procedures.forEach((procedure) {

      if (serviceProcedureRE.hasMatch(procedure.name)) {
        result['service_procedures'].add({'procedure': procedure, 'procedure_name': procedure.name});

      } else if (serviceGetterProcedureRE.hasMatch(procedure.name)) {
        var match = serviceGetterProcedureRE.firstMatch(procedure.name);
        result['service_getters'].add({'procedure': procedure, 'procedure_name': match.group(1)});

      } else if (serviceSetterProcedureRE.hasMatch(procedure.name)) {
        var match = serviceSetterProcedureRE.firstMatch(procedure.name);
        result['service_setters'].add({'procedure': procedure, 'procedure_name': match.group(1)});

      } else if (classMethodProcedureRE.hasMatch(procedure.name)) {
        var match = classMethodProcedureRE.firstMatch(procedure.name);
        result['class_methods']
            .add({'class_name': match.group(1), 'procedure': procedure, 'procedure_name': match.group(2)});

      } else if (classStaticMethodProcedureRE.hasMatch(procedure.name)) {
        var match = classStaticMethodProcedureRE.firstMatch(procedure.name);
        result['class_static_methods']
            .add({'class_name': match.group(1), 'procedure': procedure, 'procedure_name': match.group(2)});

      } else if (classGetterMethodProcedureRE.hasMatch(procedure.name)) {
        var match = classGetterMethodProcedureRE.firstMatch(procedure.name);
        result['class_getters']
            .add({'class_name': match.group(1), 'procedure': procedure, 'procedure_name': match.group(2)});

      } else if (classSetterMethodProcedureRE.hasMatch(procedure.name)) {
        var match = classSetterMethodProcedureRE.firstMatch(procedure.name);
        result['class_setters']
            .add({'class_name': match.group(1), 'procedure': procedure, 'procedure_name': match.group(2)});
      }
    });
    return result;
  }

  static List<Map<String, dynamic>> _buildParameters(List<Parameter> parameters) {
    var result = <Map<String, dynamic>>[];
    parameters.forEach((parameter) {
      result.add({
        'parameter_name': toCamelCase(parameter.name),
        'parameter_type': convert(parameter.type),
        'parameter_default_value': parameter.defaultValue.toString(),
        'comma': true,
      });
    });
    result.isNotEmpty ? result.last['comma'] = false : null;
    // Remove the "this" parameters, useless in Dart context
    result.removeWhere((data) => data['parameter_name'] == 'this');
    return result;
  }
}

