import 'package:krpc_dart/krpc_dart.dart';

/// This script gets the kRPC version out of the server, without the need of
/// building the API. Manually change the KrpcClient parameter to match your
/// configuration.
void main() async {
  var client = KrpcClient(
      ip: '192.168.0.150',
      rpcPort: 50000,
      streamPort: 50001,
      clientName: 'client');

  try {
    await client.connectRPC();
    print('Connected!');
  } on KrpcConnectionError catch (e) {
    print(e.toString());
  } on Exception catch (e) {
    print(e.toString());
  }

  try {
    // 1. Encode the Request to get the server status and send it
    final rawResponse = await client.rpcCall(ProtobufHandler.encodeRequest([
      ProtobufHandler.procedureCallBuilder('KRPC','GetStatus')
    ]));

    // 2. Decode the Response to get the Status information as JSON
    final statusProcedureResult =
        ProtobufHandler.responseResultsBuilder(rawResponse).first;
    final statusRawData =
        ProtobufHandler.getProcedureResultData(statusProcedureResult);
    final krpcVersion = getVersionFromRawStatus(statusRawData);
    print('kRPC version: $krpcVersion');
  } on KrpcConnectionError catch (e) {
    print(e.toString());
  } on Exception catch (e) {
    print('Unhandled Exception: $e');
  }

  await client.disconnect();
  print('Disconnected!');
}
