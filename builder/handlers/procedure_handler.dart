import '../krpc_dart_builder_exceptions.dart';
import '../proto/krpc.pb.dart' show Procedure, Parameter;
import 'type_handler.dart' show TypeHandler;
import '../utils/string_utils.dart';

/// Used to sort procedures by their nature. Useful for later method writing,
/// like adding 'static' or 'get'keyword.
enum ProcedureNature {
  SERVICE_METHOD,
  SERVICE_GETTER,
  SERVICE_SETTER,
  CLASS_METHOD,
  CLASS_STATIC_METHOD,
  CLASS_GETTER,
  CLASS_SETTER,
}

/// Handles the Procedure GeneratedMessage from protobuf, and provide useful
/// strings and attributes to build the corresponding Dart method found
/// in the defined service or class.
/// To use it, simply pass the procedure instance to the constructor and get
/// the required attributes that are all read-only.
/// Remark: For parameters, use the getter and build them with a
/// [ParameterHandler]
class ProcedureHandler {

  final Procedure _procedure;
  ProcedureHandler(this._procedure) {
    _parse();
  }

  ProcedureNature _nature;
  String _dartName;
  String _dartClassName;

  Procedure get procedure => _procedure;
  List<Parameter> get arguments => _procedure.parameters;
  String get documentation => _procedure.documentation;

  bool get isStatic => nature == ProcedureNature.CLASS_STATIC_METHOD;
  bool get isGetter =>
      nature == ProcedureNature.CLASS_GETTER ||
      nature == ProcedureNature.SERVICE_GETTER;

  ProcedureNature get nature => _nature;

  String get dartReturnTypeString => TypeHandler(_procedure.returnType)
      .dartTypeString;
  String get krpcReturnTypeString => TypeHandler(_procedure.returnType)
      .krpcTypeString;
  String get dartName => toCamelCase(_dartName); // Case conversion done here
  String get dartClassName => _dartClassName;

  // Parses the procedure name in order to get it sorted by nature, extract its
  // name (BUT NOT CONVERTED TO CAMEL CASE!) and related class name if relevant.
  void _parse() {
    var serviceMethodRE = RegExp(r'^[A-Za-z]+$');
    var match = serviceMethodRE.firstMatch(procedure.name);
    if (match != null) {
      _nature = ProcedureNature.SERVICE_METHOD;
      _dartName = match.group(0);
      return;
    }
    var serviceGetterRE = RegExp(r'^get_([A-Za-z]+)$');
    match = serviceGetterRE.firstMatch(procedure.name);
    if (match != null) {
      _nature = ProcedureNature.SERVICE_GETTER;
      _dartName = match.group(1);
      return;
    }
    var serviceSetterRE = RegExp(r'^set_([A-Za-z]+)$');
    match = serviceSetterRE.firstMatch(procedure.name);
    if (match != null) {
      _nature = ProcedureNature.SERVICE_SETTER;
      _dartName = match.group(1);
      return;
    }
    var classMethodRE = RegExp(r'^([A-Za-z]+)_([A-Za-z]+)$');
    match = classMethodRE.firstMatch(procedure.name);
    if (match != null) {
      _nature = ProcedureNature.CLASS_METHOD;
      _dartClassName = match.group(1);
      _dartName = match.group(2);
      return;
    }
    var classStaticMethodRE = RegExp(r'^([A-Za-z]+)_static_([A-Za-z]+)$');
    match = classStaticMethodRE.firstMatch(procedure.name);
    if (match != null) {
      _nature = ProcedureNature.CLASS_STATIC_METHOD;
      _dartClassName = match.group(1);
      _dartName = match.group(2);
      return;
    }
    var classGetterMethodRE = RegExp(r'^([A-Za-z]+)_get_([A-Za-z]+)$');
    match = classGetterMethodRE.firstMatch(procedure.name);
    if (match != null) {
      _nature = ProcedureNature.CLASS_GETTER;
      _dartClassName = match.group(1);
      _dartName = match.group(2);
      return;
    }
    var classSetterMethodRE = RegExp(r'^([A-Za-z]+)_set_([A-Za-z]+)$');
    match = classSetterMethodRE.firstMatch(procedure.name);
    if (match != null) {
      _nature = ProcedureNature.CLASS_SETTER;
      _dartClassName = match.group(1);
      _dartName = match.group(2);
      return;
    }
    throw KrpcDartBuilderException(
        'A procedure could not be parsed.\n'
        'Procedure name: ${_procedure.name}');
  }
}