import 'package:krpc_dart/krpc_dart.dart';

void main() {
  // Connecting to KSP's kRPC server with default parameters:
  // ip: 127.0.0.1, rpcPort: 50000, streamPort: 50001, name: krpc-dart
  var client = Client()..connect();

  // Getting active vessel, if any, and print its name
  var vessel = client.spaceCenter.activeVessel;
  print(vessel?.name);
}