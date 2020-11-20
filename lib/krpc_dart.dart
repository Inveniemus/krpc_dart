import 'package:build/build.dart';
import 'builder/krpc_lib_builder.dart';

// API entry points
export 'src/krpc_client.dart';

// Library builders entry points
// Builder buildProtobuf(BuilderOptions options) => ProtobufBuilder(); // <= todo?
Builder fetchKrpcServices(BuilderOptions options) => KrpcServicesFetcher(options);
Builder buildKrpcLib(BuilderOptions options) => KrpcLibBuilder();
