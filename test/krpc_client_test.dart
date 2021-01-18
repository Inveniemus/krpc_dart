import 'package:krpc_dart/krpc_dart.dart';
import 'package:test/test.dart';

void main() {
  group('KrpcClient construction', () {

    KrpcClient defaultClient;

    setUp(() {
      defaultClient = KrpcClient();
    });

    group('Default constructor', () {
      test('Default constructor shall set "localhost" as ip, 50000 as RPC port and "krpc-dart" as client name.', () {
        expect(defaultClient.websocketRpcUrl, 'ws://localhost:50000/?name=krpc-dart');
      });

      test('Default constructor shall set 50001 as stream port.', () {

      });
    });


  });
}