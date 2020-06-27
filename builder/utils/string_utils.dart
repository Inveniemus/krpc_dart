/// This module contains String utility functions, such as transformation to
/// snake case, camel case, and so on.

import 'package:recase/recase.dart';

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
    return '/// ERROR PARSING DOCUMENTATION BLOC';
  }
  var docString = docMatch.group(1);

  var summaryRegexp = RegExp(r'<summary>([\S\s]+?)</summary>');
  var summaryMatch = summaryRegexp.firstMatch(docString);
  if (summaryMatch == null) {
    return '/// ERROR PARSING DOCUMENTATION BLOC';
  }
  var summaryString = summaryMatch.group(1).trim();
  var summaryStrings = summaryString.split(RegExp(r'[\n|\r|\r\n]'));
  summaryStrings.forEach((string) {
    string.trim();
    result += '\n/// ' + string;
  });

  //todo: <remarks>

  return result;
}
