import 'dart:io';

import 'package:krpc_dart/exceptions.dart';
import 'package:krpc_dart/krpc_dart.dart';

void main() async {
  // Connecting to KSP's kRPC server with default parameters:
  // ip: 127.0.0.1, rpcPort: 50000, streamPort: 50001, name: krpc-dart
  var client = Client();
  try {
    await client.connect(ipAddress: '192.168.100.33', rpcPort: 50000);
  } on ConnectionKrpcDartException catch(e) {
    print('Connection error: ' + e.message.toString());
    exit(-1);
  }

  try{
    print('Client name: ${await client.krpc.getClientName()}');
    print('Paused: ${await client.krpc.paused}');
    await client.krpc.setPaused(false);
    print('Paused: ${await client.krpc.paused}');
    print('Current Game scene: ${await client.krpc.currentGameScene}');
    print('Current Game mode: ${await client.spaceCenter.gameMode}');
    var vessel = await client.spaceCenter.activeVessel;
    print(await vessel.name);
    print(await vessel.type);
    var autopilot = await vessel.autoPilot;
    await autopilot.setSAS(true);
    await autopilot.setSASMode(SASMode.PROGRADE);
    print('SpeedMode:');
    var control = await vessel.control;
    await control.setSpeedMode(SpeedMode.SURFACE);
    sleep(Duration(seconds: 1));
    await control.setSpeedMode(SpeedMode.ORBIT);
    print('Vessels: ${await client.spaceCenter.vessels}');
    print('Launchable vessels: ${await client.spaceCenter.launchableVessels('VAB')}');
    await client.krpc.setPaused(true);
  } on KrpcError catch(e) {
    print('ERROR: ${e.message}');
    exit(1);
  } on NotImplementedKrpcDartException catch(e) {
    print('NOT IMPLEMENTED EXCEPTION: ${e.message}');
    exit(1);
  }
  exit(0);
}