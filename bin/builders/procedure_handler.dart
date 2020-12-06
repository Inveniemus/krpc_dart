import '../../lib/proto/krpc.pb.dart' show Procedure;
import '../utils.dart';

/// This class handles provided kRPC data to get its nature
class ProcedureHandler {
  final Procedure procedure;

  ProcedureHandler(this.procedure) {
    _analyze();
  }

  ProcedureNature nature;
  String _krpcName;
  String className;

  String get krpcName {
    if (_krpcName == null) {
      throw ProcedureHandlerException(
          'Builder: a Procedure could not be identified by its name:\n'
          ' ${procedure.name}');
    } else {
      return _krpcName;
    }
  }

  String get dartName => toCamelCase(krpcName);

  bool get isStatic => nature == ProcedureNature.classStaticMethod;

  bool get isGetter =>
      nature == ProcedureNature.classGetter ||
      nature == ProcedureNature.serviceGetter;

  bool get isSetter =>
      nature == ProcedureNature.classSetter ||
      nature == ProcedureNature.serviceSetter;

  bool get isService =>
      nature == ProcedureNature.serviceProcedure ||
      nature == ProcedureNature.serviceSetter ||
      nature == ProcedureNature.serviceGetter;

  void _analyze() {
    RegExp serviceGetterRE = RegExp(r"get_(\S+)");
    RegExp serviceSetterRE = RegExp(r"set_(\S+)");
    RegExp classMethodRE = RegExp(r"(\S+)_(\S+)");
    RegExp classStaticMethodRE = RegExp(r"(\S+)_static_(\S+)");
    RegExp classGetterRE = RegExp(r"(\S+)_get_(\S+)");
    RegExp classSetterRE = RegExp(r"(\S+)_set_(\S+)");

    Match serviceGetterM = serviceGetterRE.firstMatch(procedure.name);
    Match serviceSetterM = serviceSetterRE.firstMatch(procedure.name);
    Match classMethodM = classMethodRE.firstMatch(procedure.name);
    Match classStaticMethodM = classStaticMethodRE.firstMatch(procedure.name);
    Match classGetterM = classGetterRE.firstMatch(procedure.name);
    Match classSetterM = classSetterRE.firstMatch(procedure.name);

    if (classStaticMethodM != null) {
      nature = ProcedureNature.classStaticMethod;
      _krpcName = classStaticMethodM.group(2);
      className = classStaticMethodM.group(1);
    } else if (classGetterM != null) {
      nature = ProcedureNature.classGetter;
      _krpcName = classGetterM.group(2);
      className = classGetterM.group(1);
    } else if (classSetterM != null) {
      nature = ProcedureNature.classSetter;
      _krpcName = classSetterM.group(2);
      className = classSetterM.group(1);
    } else if (serviceGetterM != null) {
      nature = ProcedureNature.serviceGetter;
      _krpcName = serviceGetterM.group(1);
    } else if (serviceSetterM != null) {
      nature = ProcedureNature.serviceSetter;
      _krpcName = serviceSetterM.group(1);
    } else if (classMethodM != null) {
      nature = ProcedureNature.classMethod;
      _krpcName = classMethodM.group(2);
      className = classMethodM.group(1);
    } else {
      nature = ProcedureNature.serviceProcedure;
      _krpcName = procedure.name;
    }
  }
}

enum ProcedureNature {
  serviceProcedure,
  serviceGetter,
  serviceSetter,
  classMethod,
  classStaticMethod,
  classGetter,
  classSetter,
}

class ProcedureHandlerException implements Exception {
  String message;

  ProcedureHandlerException(this.message);

  @override
  String toString() => 'Procedure Handler Exception: $message';
}
