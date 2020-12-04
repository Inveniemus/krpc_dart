import 'dart:io';
import 'package:yaml/yaml.dart';
import 'package:krpc_dart/krpc_dart.dart';

/// Execute this script to extract kRPC Services as a JSON file that will be
/// used by the builder to create the Dart corresponding API.
Future<void> main() async {
  // ADAPT TO YOUR CONFIGURATION IN "connection_config.yaml" file.
  final config =
      loadYaml(await File('./bin/connection_config.yaml').readAsString());

  final client = KrpcClient(
      ip: config['ip'],
      rpcPort: config['rpc'],
      streamPort: config['stream'],
      clientName: config['name']);

  try {
    print('Starting services extraction script...');
    await client.connectRPC();

    print('RPC call to get the services data...');
    final services_response = await client.rpcCall(
        ProtobufHandler.encodeRequest([
      ProtobufHandler.procedureCallBuilder(
          service: 'KRPC', procedure: 'GetServices')
    ]));

    print('Decoding received data...');
    final servicesProcedureResult =
        ProtobufHandler.responseResultsBuilder(services_response).first;

    final servicesString = getServicesJsonString(
        ProtobufHandler.getProcedureResultData(servicesProcedureResult));

    print('Writing the JSON file...');
    final outputFile = await File('./builder/services.krpc.json').create();
    await outputFile.writeAsString(servicesString);

  } on KrpcConnectionError catch (error) {
    print(error.toString());
    throw 'EXITING ON UNRECOVERABLE ERROR!';
  }

  await client.disconnect();
  print('Finished!');
}
