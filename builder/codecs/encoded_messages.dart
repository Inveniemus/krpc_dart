import 'dart:typed_data' show Uint8List;

import '../proto/krpc.pb.dart'
  show Request, ProcedureCall;

class EncodedMessages{
  static Uint8List getClientID() {
    var request = Request()
        ..calls.add(
          ProcedureCall()
              ..service = 'KRPC'
              ..procedure = 'GetClientID'
        );

    return request.writeToBuffer();
  }

  static Uint8List getServices() {
    var request = Request()
      ..calls.add(
          ProcedureCall()
            ..service = 'KRPC'
            ..procedure = 'GetServices'
      );

    return request.writeToBuffer();
  }
}