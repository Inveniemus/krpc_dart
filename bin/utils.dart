/// This module contains String utility functions, such as transformation to
/// snake case, camel case, and so on.

import 'package:recase/recase.dart';
import '../lib/proto/krpc.pb.dart' show Type;

/// For file names
String toSnakeCase(String input) {
  return ReCase(input).snakeCase;
}

/// For class names
String toPascalCase(String input) {
  return ReCase(input).pascalCase;
}

/// For class attributes and methods/function names
String toCamelCase(String input) {
  return ReCase(input).camelCase;
}

String toScreamingCase(String input) {
  return ReCase(input).constantCase;
}

String parseDoc(String xmlDoc) {

  var result = '';

  var docRegexp = RegExp(r'<doc>([\S\s]+?)</doc>');
  var docMatch = docRegexp.firstMatch(xmlDoc);
  if (docMatch == null) {
    return '/// ERROR PARSING DOCUMENTATION BLOC\n';
  }
  var docString = docMatch.group(1);

  // Start with inline stuff
  var paramrefRegexp = RegExp(r'<paramref name="(\w+)" />');
  docString = docString.replaceAllMapped(
      paramrefRegexp,
          (match) => '[${match[1]}]'
  );

  result += '/// ';
  var summaryRegexp = RegExp(r'<summary>([\S\s]+?)</summary>');
  var summaryMatch = summaryRegexp.firstMatch(docString);
  if (summaryMatch == null) {
    return '/// ERROR PARSING DOCUMENTATION BLOC\n';
  }
  var summaryString = summaryMatch.group(1).trim();
  var summaryStrings = summaryString.split(RegExp(r'[\n|\r|\r\n]'));
  summaryStrings.forEach((string) {
    string.trim();
    result += string + ' ';
  });

  var paramRegexp = RegExp(r'<param name="(\w+)">([\S\s]+?)</param>', multiLine: true);
  var matches = paramRegexp.allMatches(docString);
  if (matches.isNotEmpty) {
    matches.forEach((match) {
      var description = match[2];
      description = description.replaceAllMapped(RegExp(r'[\n|\r|\r\n]'), (match) => ' ');
      result += '\n/// [${match[1]}] : ${description}';
    });
  }

  var returnsRegexp = RegExp(r'<returns>([\S\s]+?)</returns>');
  var returnsMatch = returnsRegexp.firstMatch(docString);
  if (returnsMatch != null) {
    result += '\n/// Returns: ';
    var returnsString = returnsMatch.group(1).trim();
    var returnsStrings = returnsString.split(RegExp(r'[\n|\r|\r\n]'));
    returnsStrings.forEach((string) {
      string.trim();
      result += string + ' ';
    });
  }

  var remarksRegexp = RegExp(r'<remarks>([\S\s]+?)</remarks>');
  var remarksMatch = remarksRegexp.firstMatch(docString);
  if (remarksMatch != null) {
    result += '\n/// Remarks: ';
    var remarksString = remarksMatch.group(1).trim();
    var remarksStrings = remarksString.split(RegExp(r'[\n|\r|\r\n]'));
    remarksStrings.forEach((string) {
      string.trim();
      result += string + ' ';
    });
  }

  // todo: <see .../>
  // todo: <list type="bullet">
  // todo: <math>
  // todo: <c>

  return result.trim();
}

String typeAnalyzer(Type type) {
  String result = '${type.code.name}';
  if (type.hasName()) result += '[${type.name}]';
  if (type.types.isNotEmpty) {
    result += '(';
    for (final subtype in type.types) {
      result += typeAnalyzer(subtype);
      result += ', ';
    }
    result += ')';
  }
  return result;
}