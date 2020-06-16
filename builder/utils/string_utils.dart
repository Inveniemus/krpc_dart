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