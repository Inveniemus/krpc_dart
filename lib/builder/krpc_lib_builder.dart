import 'dart:async';

import 'package:build/build.dart';
import 'package:krpc_dart/src/proto_handler.dart';
import '../src/krpc_client.dart';

/// This class is used automatically by build_runner to generate the kRPC
/// API out of the Services message provided by the RPC server.
class KrpcLibBuilder implements Builder {
  final BuilderOptions options;

  KrpcLibBuilder(this.options);

  @override
  Map<String, List<String>> get buildExtensions {
    return {
      '.dummy': ['.json', '.dart']
    };
  }

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    builderLog('Starting to build the kRPC Dart library with options:\n'
        '${options.config.toString()}');

    if (options.config['connected']) {

      // 1. Connect to kRPC
      builderLog('Connecting to kRPC...');
      final client = KrpcClient(
        ip: options.config['ip'],
        rpcPort: options.config['rpcPort'],
      );
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

    } else {
      builderLog('Using already generated "input.json"');
    }
  }
}

void builderLog(String input) {
  print('[KRPC builder]: $input');
}
