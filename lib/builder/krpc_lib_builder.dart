import 'dart:async';

import 'package:build/build.dart';

/// This class is used automatically by build_runner to generate the kRPC
/// API out of the Services message provided by the RPC server.
class KrpcLibBuilder implements Builder {

  @override
  Map<String, List<String>> get buildExtensions {
    return {'.dummy': ['.dart']};
  }

  @override
  FutureOr<void> build(BuildStep buildStep) {
    print('test');
  }
}