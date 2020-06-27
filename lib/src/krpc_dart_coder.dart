import 'dart:typed_data';

import 'package:krpc_dart/proto/krpc.pb.dart'
    show Request, ProcedureCall;

class Coder {
  static Uint8List ClientIDRequest() {
    var request = Request();
    var call = ProcedureCall();
    request.calls.add(call);
    call.service = 'KRPC';
    call.procedure = 'GetClientID';
  }
}