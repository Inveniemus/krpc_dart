import 'dart:io' show File;
import 'package:mustache_template/mustache_template.dart';
import 'proto/krpc.pb.dart' show Service, Procedure;
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
    data['service_name'] = toPascalCase(_service.name);
    data['documentation'] = parseDoc(_service.documentation);

    _buildClasses();
    _buildEnumerations();

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

      var className = toPascalCase(element.name);
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
}

/// Builds the library root file, the one that needs to be imported to use it.
void buildService(Service service) {
  print('\nBuilding ${service.name}...');

  var template =
      Template(File('builder/templates/services.html').readAsStringSync());

  var fileName = 'lib/src/services/${toSnakeCase(service.name)}.dart';
  File(fileName).createSync(recursive: true);
  var file = File(fileName);

  var procedure_data = parseProcedures(service.procedures);

  var serviceProcedures = procedure_data['service_procedures'];
  var serviceGetters = procedure_data['service_getters'];
  var serviceSetters = procedure_data['service_setters'];
  var classMethods = procedure_data['class_methods'];
  var classStaticMethods = procedure_data['class_static_methods'];
  var classGetters = procedure_data['class_getters'];
  var classSetters = procedure_data['class_setters'];

  var classes = [];
  service.classes.forEach((item) {
    var thisClassMethods = classMethods.where((element) => element['class'] == item.name).toList();
    classes.add({
      'name': item.name,
      'documentation': parseDoc(item.documentation),
      'class_methods': thisClassMethods,
    });
  });

  var procedures = [];
  service.procedures.forEach((procedure) {
    var parameters = [];
    procedure.parameters.forEach((parameter) {
      parameters.add({
        'name':
            parameter.name == 'this' ? '_' + parameter.name : parameter.name,
        'type': convert(parameter.type),
        'comma': true,
      });
    });
    if (parameters.isNotEmpty) parameters.last['comma'] = false;

    procedures.add({
      'name': toCamelCase(procedure.name),
      'parameters': parameters,
      'return_type': convert(procedure.returnType),
    });
  });

  file.writeAsStringSync(template.renderString({
    'documentation': parseDoc(service.documentation),
    'name': toPascalCase(service.name),
    'classes': classes,
    'service_procedures': procedures,
  }));
}

Map<String, dynamic> parseProcedures(List<Procedure> procedures) {

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
      print('  ${procedure.name}');
      result['service_procedures'].add({'procedure': procedure, 'name': procedure.name});

    } else if (serviceGetterProcedureRE.hasMatch(procedure.name)) {
      var match = serviceGetterProcedureRE.firstMatch(procedure.name);
      print('  ${match.group(1)} [get]');
      result['service_getters'].add({'procedure': procedure, 'name': match.group(1)});

    } else if (serviceSetterProcedureRE.hasMatch(procedure.name)) {
      var match = serviceSetterProcedureRE.firstMatch(procedure.name);
      print('  ${match.group(1)} [set]');
      result['service_setters'].add({'procedure': procedure, 'name': match.group(1)});

    } else if (classMethodProcedureRE.hasMatch(procedure.name)) {
      var match = classMethodProcedureRE.firstMatch(procedure.name);
      print('  ${match.group(1)} - ${match.group(2)}');
      result['class_methods']
          .add({'class': match.group(1), 'procedure': procedure, 'name': match.group(2)});

    } else if (classStaticMethodProcedureRE.hasMatch(procedure.name)) {
      var match = classStaticMethodProcedureRE.firstMatch(procedure.name);
      print('  ${match.group(1)} - ${match.group(2)} [static]');
      result['class_static_methods']
          .add({'class': match.group(1), 'procedure': procedure, 'name': match.group(2)});

    } else if (classGetterMethodProcedureRE.hasMatch(procedure.name)) {
      var match = classGetterMethodProcedureRE.firstMatch(procedure.name);
      print('  ${match.group(1)} - ${match.group(2)} [get]');
      result['class_getters']
          .add({'class': match.group(1), 'procedure': procedure, 'name': match.group(2)});

    } else if (classSetterMethodProcedureRE.hasMatch(procedure.name)) {
      var match = classSetterMethodProcedureRE.firstMatch(procedure.name);
      print('  ${match.group(1)} - ${match.group(2)} [set]');
      result['class_setters']
          .add({'class': match.group(1), 'procedure': procedure, 'name': match.group(2)});
    }
  });
  return result;
}
