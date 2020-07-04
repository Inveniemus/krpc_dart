import 'package:krpc_dart/src/krpc_dart_coder.dart';
import 'package:test/test.dart';

void main() {
  group('method encodeRequest', () {
    test('Compare results of encodeRequest and manual encoded', () {
      var manual = Coder.ClientIDRequest();
      var encoded = Coder.encodeSingleRequest({
        'service': 'KRPC',
        'procedure': 'GetClientID'
      });
      expect(manual.toString() == encoded.toString(), true);
    });
  });
}