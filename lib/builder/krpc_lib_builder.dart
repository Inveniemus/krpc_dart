import 'dart:async';

import 'package:build/build.dart';
import 'package:krpc_dart/src/proto_handler.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../src/krpc_client.dart';

/// This class is used automatically by build_runner to generate the kRPC
/// API out of the Services message provided by the RPC server.
class KrpcLibBuilder implements Builder {
  @override
  Map<String, List<String>> get buildExtensions {
    return {
      '.dummy': ['.dart', '.json']
    };
  }

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    builderLog('Starting to build the kRPC Dart library...');

    // 1. Connect to kRPC
    builderLog('Connecting to kRPC...');
    final client = KrpcClient(ip: '192.168.0.175');
    await client.connectRPC();

    // 2. Fetch the services
    var rawServices =
        await client.rpcCall(ProtobufHandler.encodeServicesRequest());
    var services = ProtobufHandler.decodeServicesResponse(rawServices);
    await client.disconnect();
    builderLog('Found ${services.services.length} services!');

    // 3. Write them in a temporary JSON file.
    builderLog('Writing temporary JSON file...');
    var servicesAsJson = services.writeToJson();
    var tempAssetId = buildStep.inputId.changeExtension('.json');
    await buildStep.writeAsString(tempAssetId, servicesAsJson);
    builderLog('Temporary "input.json" file written.');
  }
}

void builderLog(String input) {
  print('[KRPC builder]: $input');
}
