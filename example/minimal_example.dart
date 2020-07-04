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


  print('Client name: ${await client.krpc.getClientName()}');
  print('Paused: ${await client.krpc.paused}');
  print('Current Game scene: ${await client.krpc.currentGameScene}');
  print('Science: ${await client.spaceCenter.science}');
  Vessel vessel = await client.spaceCenter.activeVessel;
  exit(0);
}