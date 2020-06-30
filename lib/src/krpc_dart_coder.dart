import 'dart:typed_data';

import 'package:krpc_dart/proto/krpc.pb.dart'
    show Request, ProcedureCall, Argument;

class Coder {

  /// Request encoder from [dataList] map that should follow the following
  /// structure, derived from the protobuf Request message structure:
  /// {'service': <service name, as string>,
  ///  'procedure': <procedure name, as string>,
  ///  'serviceId': <service id, as int>,
  ///  'procedureId': <procedure id, as int>,
  ///  'arguments': [
  ///    {'position': <argument's position, as int>,
  ///     'value': <value, as any type it may have>,
  ///  ],
  /// }
  static Uint8List encodeRequest(List<Map<String, dynamic>> dataList) {
    var request = Request();
    dataList.forEach((data) {
      var call = ProcedureCall();
      request.calls.add(call);
      
      if (data.containsKey('service') && data['service'] is String) {
        call.service = data['service'];
      } else if (data.containsKey('serviceId') && data['serviceId'] is int) {
        call.serviceId = data['serviceId'];
      } else {
        // todo: throw an exception
      }

      if (data.containsKey('procedure') && data['procedure'] is String) {
        call.procedure = data['procedure'];
      } else if (data.containsKey('procedureId') && data['procedureId'] is int) {
        call.procedureId = data['procedureId'];
      } else {
        // todo: throw an exception
      }

      if (data.containsKey('arguments')) {
        List<Map<String, dynamic>> arguments = data['arguments'];
        arguments.sort((argA, argB) =>
            argA['position'].compareTo(argB['position']));
        arguments.forEach((argumentData) {
          var argument = Argument();
          argument.position = argumentData['position'];
          argument.value = argumentData['value'];
        });
      }
    });
    return request.writeToBuffer();
  }

  static Uint8List ClientIDRequest() {
    var request = Request();
    var call = ProcedureCall();
    request.calls.add(call);
    call.service = 'KRPC';
    call.procedure = 'GetClientID';
    return request.writeToBuffer();
  }
}