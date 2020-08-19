import 'dart:convert';
import 'dart:io' show File;
import 'package:mustache_template/mustache_template.dart';
import 'handlers/parameter_handler.dart';
import 'handlers/procedure_handler.dart';
import 'handlers/type_handler.dart';
import 'proto/krpc.pb.dart' show Service, Procedure, Parameter, Type;
import 'utils/string_utils.dart';

/// This class builds a Service. It provides a [Map<String, dynamic>] of its
/// service [data], and write a library file [outFile].
class ServiceBuilder {

  final Service _service;
  final _template = Template(File('builder/templates/services.html')
      .readAsStringSync());

  File outFile;
  Map<String, dynamic> data = {
    'library_name': '',
    'service_name': '',
    'service_procedures': [],
    'service_getters': [],
    'service_setters': [],
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
    data['library_name'] = toSnakeCase(_service.name);
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

  // Depends on _buildClasses, call this method AFTER!
  void _buildProcedures() {
    assert(data['classes'].isNotEmpty);
    _service.procedures.forEach((procedure) {
      var handler = ProcedureHandler(procedure);
      var procedureData = <String, dynamic>{
        // Documentation string
        'documentation': parseDoc(handler.documentation),
        // Dart return handling
        'dart_return_type': handler.dartReturnTypeString,
        'has_return': handler.dartReturnTypeString != 'void',
        // Name of the Dart method
        'dart_name': handler.dartName,
        // Arguments of the CallMetaData constructor
        'service_krpc_name': _service.name,
        'procedure_krpc_name': handler.krpcName,
        'krpc_return_type': handler.krpcReturnTypeString,
        'arguments': [
          {'argument_name': 'return_type',
            'argument_value': handler.krpcReturnTypeString},
          {'argument_name': 'return_type_name',
            'argument_value': handler.dartReturnTypeString},
          {'argument_name': 'service_name_snake',
            'argument_value': toSnakeCase(_service.name)},
        ],
        'krpc_arguments': <Map<String, dynamic>>[],
      };

      var parametersDataList = <Map<String, dynamic>>[];
      // Build parameters with _buildParameter
      for (var index = 0; index < procedure.parameters.length; index++) {
        parametersDataList.add(
            _buildParameter(procedure.parameters[index], index)
        );
      }
      procedure.parameters.forEach((parameter) {

      });
      // Remove the 'this' parameter
      parametersDataList.removeWhere((element) {
        return element['parameter_name'] == 'this';
      });
      if (parametersDataList.isNotEmpty) {
        // set 'comma' to false for the last parameter
        parametersDataList.last['comma'] = false;
      }
      procedureData['parameters'] = parametersDataList;

      var classData;
      if (handler.dartClassName != null) {
        classData = data['classes'].firstWhere((element) {
          return element['class_name'] == handler.dartClassName;
        });
      }

      switch (handler.nature) {
        case ProcedureNature.SERVICE_METHOD:
          data['service_procedures'].add(procedureData);
          break;
        case ProcedureNature.SERVICE_GETTER:
          data['service_getters'].add(procedureData);
          break;
        case ProcedureNature.SERVICE_SETTER:
          data['service_setters'].add(procedureData);
          break;
        case ProcedureNature.CLASS_METHOD:
          classData['class_methods'].add(procedureData);
          break;
        case ProcedureNature.CLASS_STATIC_METHOD:
          classData['class_static_methods'].add(procedureData);
          break;
        case ProcedureNature.CLASS_GETTER:
          classData['class_getters'].add(procedureData);
          break;
        case ProcedureNature.CLASS_SETTER:
          classData['class_setters'].add(procedureData);
          break;
      }
    });
  }

  /// Builds data with a [ParameterHandler] in order to get required fields
  /// to build the Service or Class method's parameter, in Dart, and the
  /// required pieces of data to build the krpc parameters for the encoder.
  Map<String, dynamic> _buildParameter(Parameter parameter, int position) {
    var handler = ParameterHandler(parameter);
    var parameterData = {
      'position': position,
      'krpc_type': handler.krpcTypeString,
      'parameter_type': handler.dartTypeString,
      'parameter_name': handler.name,
      'comma': true,
    };
    return parameterData;
  }
}

