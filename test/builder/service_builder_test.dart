import 'dart:io';

import 'package:logging/logging.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:krpc_dart/builder/service_builder.dart';

class LoggerMock extends Mock implements Logger {}

void main() {

  File servicesDataFile;
  String servicesJsonString;
  Logger logger;

  setUpAll(() async {
    // 1. Get the raw data of the services
    servicesDataFile = File('test/builder/input.json');
    servicesJsonString = await servicesDataFile.readAsString();

    // 2. Logger mock
    logger = LoggerMock();
  });

  test('test', () {
    var builder = ServicesBuilder(servicesJsonString, logger);
    verify(logger.info('Starting Services Builder process...')).called(1);
  });
}