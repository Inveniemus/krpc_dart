import 'package:krpc_dart/api/krpc.dart';
import 'package:krpc_dart/api/space_center.dart';
import 'package:krpc_dart/krpc_dart.dart';

void main() async {
  final client = KrpcClient(ip: '192.168.0.149');
  try {
    await client.connectRPC();
  } on Exception catch (e) {
    print(e.toString());
  }

  final krpcService = KRPC(client);
  final spaceCenterService = SpaceCenter(client);
  print(await krpcService.getClientID());
  print(await krpcService.paused);
  print(await krpcService.getClientName());
  print((await krpcService.getStatus()).version);


  client.disconnect();
}