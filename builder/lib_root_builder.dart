import 'dart:io';
import 'package:mustache_template/mustache_template.dart';

/// Builds the library root file, the one that needs to be imported to use it.
void buildLibRoot(Map<String, dynamic> data) {

  var template = Template(
    File('builder/templates/lib_root.html').readAsStringSync()
  );

  File('lib/krpc_dart.dart').createSync(recursive: true);
  var file = File('lib/krpc_dart.dart');
  file.writeAsStringSync('');

  file.writeAsStringSync(
    template.renderString(data)
  );
}