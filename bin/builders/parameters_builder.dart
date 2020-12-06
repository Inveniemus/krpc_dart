import '../../lib/proto/krpc.pb.dart';
import '../utils.dart';
import 'type_handler.dart';

class ParametersBuilder {
  final List<Parameter> parameters;
  ParametersBuilder(this.parameters);

  String _build() {
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

  @override
  String toString() => _build();
}