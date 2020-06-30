/// This script builds the lib out of the 'services' protobuf message delivered
/// by kRPC. It requires an RPC connection to KSP.

import 'package:web_socket_channel/io.dart';
import 'dart:io';
import 'dart:async';

import 'codecs/decode_messages.dart';
import 'codecs/encoded_messages.dart';
import 'lib_root_builder.dart';
import 'service_builder.dart';
import 'utils/string_utils.dart';

void main() async {

  print('Welcome! This is the kRPC Dart builder.');

  print('Please choose:');
  print('(O) Offline build? (N) Online build? (E) Exit: ');
  var servicesAsBytesTable;
  while (true) {
    var answer = await stdin.readLineSync().toUpperCase();
    if (answer == 'O') {
      if (File('out/debug/raw_services_data').existsSync()) {
        servicesAsBytesTable =
            File('out/debug/raw_services_data').readAsBytesSync();
        break;
      } else {
        print("Couldn't find the bytes file... "
            'Try online connected to KSP, maybe?');
      }
    } else if (answer == 'N') {
      // Get ip and RPC port
      print('Please ensure that Kerbal Space Program is running with kRPC module'
          ' installed, server is connected with the web sockets protocol.'
          '\nPress enter when ready!');

      await stdin.readLineSync();

      var ip = 'not good';
      var ipRegexp = RegExp(r'\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}');
      while(!ipRegexp.hasMatch(ip)) {
        print("Let's start with ip address:");
        await (ip = stdin.readLineSync());
      }

      var rpc = 'not good';
      var rpcRegexp = RegExp(r'\d+');
      while(!rpcRegexp.hasMatch(rpc)) {
        print('Now the RPC port number:');
        await (rpc = stdin.readLineSync());
      }
      // Connect to the RPC web socket
      print('Connecting to KSP...');

      final rpcStreamController = StreamController();
      var rpcChannel = IOWebSocketChannel.connect(
          'ws://' + ip + ':' + rpc + '/?name=builder...'
      );

      rpcChannel.stream.listen((event) {
        rpcStreamController.add(event);
      }, onError: (error) {
        print('!!!\nAn error of connection occured! Please check your connection '
            'parameters and try again!\n!!!');
      }, onDone: () {
        print('KSP left! It should not have happened!');
        exit(1);
      });

      rpcChannel.sink.add(EncodedMessages.getServices());
      servicesAsBytesTable = await rpcStreamController.stream.first;
      await File('out/debug/raw_services_data').create(recursive: true).then(
              (File file) => file.writeAsBytes(servicesAsBytesTable)
      );
      break;
    } else if (answer == 'E') {
      exit(0);
    }
  }

  print('Thank you, now please wait, we are working on it!');

  var servicesHolder = Decode.getServices(servicesAsBytesTable);
  var services = servicesHolder.services;
  print(services.length.toString() + ' services found.');

  // Build the library root
  var data = {'service_names': []};
  services.forEach((service) => data['service_names']
      .add({'filename': toSnakeCase(service.name), 'classname': service.name}));
  buildLibRoot(data);

  // Build the Services
  //services.forEach((service) => buildService(service));
  services.forEach((service) {
    var builder = ServiceBuilder(service);
    builder.run();
  });

  exit(0);
}