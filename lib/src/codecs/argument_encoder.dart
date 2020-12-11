import '../../proto/krpc.pb.dart' show Argument;

class ArgumentEncoder {
  final Map<String, dynamic> parameterMetaData;
  ArgumentEncoder(this.parameterMetaData);

  Argument encode() {
    final argument = Argument();
    argument.position = parameterMetaData['position'];
    if (parameterMetaData.containsKey('class_ref')) {
      argument.value = parameterMetaData['class_ref'];
    }
    return argument;
  }
}