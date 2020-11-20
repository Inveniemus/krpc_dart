import 'package:krpc_dart/builder/string_utils.dart';
import 'package:logging/logging.dart';

import '../proto/krpc.pb.dart'
    show Service;

/// The Service Builder fetch all required fields (procedures, classes, etc.) to
/// build them and provides data to populate the Service template.
class ServiceBuilder {
  final Service service;
  final Logger logger;
  ServiceBuilder(this.service, this.logger);

  String get filename =>
      service.name == 'KRPC' ? 'KRPC' : toSnakeCase(service.name);

  Map<String, dynamic> data = {};

  void build() {
    data['documentation'] = parseDoc(service.documentation);
  }

  @override
  String toString() => data.toString();
}