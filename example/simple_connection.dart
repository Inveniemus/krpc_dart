import 'package:krpc_dart/krpc_dart.dart';

void main() async {
  var client = KrpcClient(ip: '192.168.0.149');

  try {
    await client.connectRPC();
  } on KrpcConnectionError catch (e) {
    print(e.toString());
  } on Exception catch (e) {
    print(e.toString());
  }

  print('Connected!');

  try {
    // 1. Encode the Request to get the server status and send it
    final rawResponse = await client.rpcCall(ProtobufHandler.encodeRequest([
      ProtobufHandler.procedureCallBuilder(
          service: 'KRPC', procedure: 'GetStatus')
    ]));

    // 2. Decode the Response to get the Status information as JSON
    final statusProcedureResult =
        ProtobufHandler.responseResultsBuilder(rawResponse).first;
    final statusRawData =
        ProtobufHandler.getProcedureResultData(statusProcedureResult);
    final krpcVersion = getVersionFromRawStatus(statusRawData);
    print('kRPC version: $krpcVersion');
  } on Exception catch (e) {
    print('Unhandled Exception: $e');
  }

  await client.disconnect();
  print('Disconnected!');
}
