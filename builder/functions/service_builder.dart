import 'dart:io';
import 'package:mustache_template/mustache_template.dart';
import '../proto/krpc.pb.dart' show Service;
import '../utils/string_utils.dart';

/// Builds the library root file, the one that needs to be imported to use it.
void buildService(Service service) {

  var template = Template(
      File('builder/templates/services.html').readAsStringSync()
  );

  var fileName = 'out/lib/src/${toSnakeCase(service.name)}.dart';
  File(fileName).createSync(recursive: true);
  var file = File(fileName);
  file.writeAsStringSync('');


}