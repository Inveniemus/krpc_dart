import 'dart:io';

import 'builders/service_builder.dart';
import 'builders/services_api_builder.dart';
import 'utils.dart';
import '../proto/krpc.pb.dart' show Services, Service;

const librariesDirectory = './lib/api/';

void main() {
  final servicesData = File('./services_output/services.krpc.json').readAsStringSync();
  final services = Services.fromJson(servicesData);

  buildServicesAPI(services);

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

/// This method builds the services_api file that exports everything and provide
/// handling methods
void buildServicesAPI(Services services) {
  final apiDirectory = Directory('./lib/api/')..createSync();
  final outFile = File(apiDirectory.path + 'services_api.dart');

  String content = ServicesAPIBuilder(services).toString();

  outFile.writeAsStringSync(content);
}
