import 'dart:io';

import 'package:mustache_template/mustache.dart';

import '../../lib/proto/krpc.pb.dart' show Services;
import '../utils.dart';

class ServicesAPIBuilder {
  final Services services;
  Template template;

  ServicesAPIBuilder(this.services){
    template =
        Template(File('./bin/builders/services_api_template').readAsStringSync());
  }

  @override
  String toString() {
    Map<String, dynamic> templateData = {};

    templateData['imports'] = services.services.map((service) => {'filename': '${toSnakeCase(service.name)}.dart'});
    templateData['services'] = services.services.map((service) => {'service_name': service.name});

    return template.renderString(templateData);
  }
}