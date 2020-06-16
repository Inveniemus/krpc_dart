import 'dart:typed_data';

import '../proto/krpc.pb.dart';

class Decode {

  static Response _buildResponse(Uint8List data) {
    return Response.fromBuffer(data);
  }

  static Services getServices(data) {
    var response = _buildResponse(data);
    if (response.error.description != '') {
      print(response.error.toString());
      // todo : error management
      return null;
    }
    if (response.results.length != 1) {
      // todo: error management, there should be only one result
      return null;
    }
    var result = response.results[0];
    if (result.error.description != '') {
      // todo : error management
      return null;
    }
    return Services.fromBuffer(result.value);
  }

}