import '../../proto/krpc.pb.dart' show Argument;

class ArgumentEncoder {
  final Map<String, dynamic> parameterMetaData;
  ArgumentEncoder(this.parameterMetaData);

  Argument encode() {
    final argument = Argument();
    argument.position = parameterMetaData['position'];
  }
}