import 'dart:io';

import 'utils.dart';
import '../lib/proto/krpc.pb.dart' show
  Services, Service;


void main() {
  final servicesData = File('./builder/services.krpc.json').readAsStringSync();
  final services = Services.fromJson(servicesData);

  for (final service in services.services) {
    buildService(service);
  }
}

/// This method builds services dart files as libraries out of the Service
/// protobuf object.
void buildService(Service service) {
  final serviceFileName = toSnakeCase(service.name);
  print(serviceFileName);
}
