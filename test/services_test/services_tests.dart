import 'dart:typed_data';

import 'package:krpc_dart/src/services/space_center.dart';
import 'package:test/test.dart';

import 'package:krpc_dart/krpc_dart.dart';

void main() {
  test('Services are imported', () {
    var spaceCenter = SpaceCenter();
    var vessel = Vessel(Uint8List(5)); // not the usual way to build it!
  });
}