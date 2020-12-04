import 'dart:io';

import 'builders/service_builder.dart';
import 'utils.dart';
import '../lib/proto/krpc.pb.dart' show Services, Service;

const librariesDirectory = './lib/api/';

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
  final apiDirectory = Directory('./lib/api/')..createSync();
  final outFile = File(apiDirectory.path + toSnakeCase(service.name) + '.dart')
    ..createSync();

  String content = ServiceBuilder(service).toString();

  outFile.writeAsStringSync(content);
}
