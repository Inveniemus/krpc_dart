import 'package:krpc_dart/builder/service_builder.dart';
import 'package:logging/logging.dart';

import '../proto/krpc.pb.dart' show Services, Service;

/// Top-level builder to create each Service one by one.
class ServicesBuilder {
  final String servicesJsonString;
  final Logger logger;

  ServicesBuilder(this.servicesJsonString, this.logger) {
    logger.info('Starting Services Builder process...');
  }

  void build() {
    final services = Services.fromJson(servicesJsonString);
    for (var service in services.services) {
      logger.info('Building service: ${service.name}');
      final serviceBuilder = ServiceBuilder(service, logger);
    }
  }
}
