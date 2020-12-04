import 'dart:io';

import '../../lib/proto/krpc.pb.dart';
import 'package:mustache_template/mustache_template.dart';

import '../utils.dart';

/// Builds the Service library file content, accessed by a call to toString().
class ServiceBuilder {
  final Service service;
  Template template;

  ServiceBuilder(this.service) {
    template =
        Template(File('./bin/builders/service_template').readAsStringSync());
  }

  String _build() {
    Map<String, dynamic> templateData = {};

    // Service
    templateData['library_name'] = service.name;
    templateData['documentation'] = parseDoc(service.documentation);

    // Classes
    templateData['classes'] = [];
    for (final _class in service.classes) {
      templateData['classes'].add({'class_name': _class.name});
    }
    return template.renderString(templateData);
  }

  @override
  String toString() => _build();
}
