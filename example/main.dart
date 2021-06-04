import 'dart:io';

import 'package:krpc_dart/krpc_dart.dart';
import 'package:krpc_dart/api/space_center.dart';
import 'package:krpc_dart/api/krpc.dart';

/// This script goes through various services, setter and getters i.o.t. check
/// features.
void main() async {

  final client = KrpcClient(ip: '192.168.0.150');
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
  print(await krpcService.currentGameScene);
  final gameMode = await spaceCenterService.gameMode;
  print(gameMode);
  final vessel = await spaceCenterService.activeVessel;

  print(await vessel.name);
  print((await krpcService.getStatus()).version);

  await krpcService.set_paused(true);
  sleep(Duration(milliseconds: 500));
  await krpcService.set_paused(false);

  await vessel.set_name('NewName!');
  print(await vessel.type);
  await vessel.set_type(VesselType.ship);
  print(await vessel.type);

  final Control control = await vessel.control;
  final autoPilot = await vessel.autoPilot;
  print('${control.ref} - ${autoPilot.ref}');
  final newVessel = Vessel(control.ref);

  await spaceCenterService.set_activeVessel(newVessel);

  print(await control.state);
  print(await autoPilot.sas);

  await control.set_sASMode(SASMode.retrograde);
  sleep(Duration(seconds: 5));
  await control.set_sASMode(SASMode.prograde);

  client.disconnect();
}