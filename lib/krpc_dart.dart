import 'package:build/build.dart';
import 'builder/krpc_lib_builder.dart';

// API entry points
export 'src/krpc_client.dart';

// Library builder entry point
Builder buildKrpcLib(BuilderOptions options) => KrpcLibBuilder();