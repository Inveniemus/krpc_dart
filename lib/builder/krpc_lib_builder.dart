import 'dart:async';

import 'package:build/build.dart';

import '../src/protobuf_handler.dart';
import '../src/krpc_client.dart';
import 'services_builder.dart';

/// This class is used automatically by build_runner to generate the input.json
/// file out of the Services message provided by the RPC server. Options need
/// to be defined in the "build.yaml" file if required. See README.
class KrpcServicesFetcher implements Builder {

  final BuilderOptions options;
  KrpcServicesFetcher(this.options);

  @override
  Map<String, List<String>> get buildExtensions => {'.dummy': ['.json']};

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
      builderLog('Using the already generated "input.json" file.');
    }
  }
}

/// This class is used to build the Dart kRPC library out of the JSON file
class KrpcLibBuilder implements Builder {

  @override
  Map<String, List<String>> get buildExtensions => {'.json': ['.dart']};

  @override
  FutureOr<void> build(BuildStep buildStep) async {

    builderLog('Building Services out of the JSON input file...');
    final assetId = buildStep.inputId;
    final jsonData = await buildStep.readAsString(assetId);

    final servicesBuilder = ServicesBuilder(jsonData, log);
    servicesBuilder.build();
  }
}

void builderLog(String input) {
  log.info('\n[KRPC builder]: $input');
}
