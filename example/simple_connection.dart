import 'package:krpc_dart/krpc_dart.dart';

void main() {
  var client = KrpcClient(ip: '192.168.0.175');
  client.connect();
}