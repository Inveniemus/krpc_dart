import 'dart:io';

import 'package:krpc_dart/krpc_dart.dart';
import 'package:test/test.dart';

void main() async {
  group('A group of tests', () {
    test('High level connection test', () async {
      var client = Client();
      client.state.stream.listen((event) => print(event.toString()));
      await client.connect(ipAddress: '192.168.100.151');
      await client.rpc.stream.last;
    });
  });
}
