import 'dart:async';
import 'dart:io';

import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';

class Client {

  WebSocketChannel _rpcChannel;
  StreamSubscription _rpcChannelSubscription;

  Map<String, dynamic> servicesMap = {};

  final rpcStreamController = StreamController();

  static const String localhostIp = '127.0.0.1';

  Future<void> _closeConnection() async {
    await _rpcChannelSubscription?.cancel();
    await _rpcChannel?.sink?.close();
  }

  Future<bool> connectRPC(
    {String ipAddress = localhostIp, int rpcPort = 50000,
        String name = 'dart-krpc'}
      ) async {
    var wsAddress = 'ws://' + ipAddress + ':' + rpcPort.toString() +
        '/?name=' + name;
    print('WebSocket address: ' + wsAddress);
    _rpcChannel = IOWebSocketChannel.connect(wsAddress);

    _rpcChannelSubscription = _rpcChannel.stream.listen((event) {
      rpcStreamController.add(event);
    }, onError: (error) async {
      print('Error!');
      await _closeConnection();
      return false;
    }, onDone: () async {
      print('Done!');
      await _closeConnection();
      return false;
    });

    _rpcChannel.sink.add(EncodedMessages.getServices());
    var rawServerStatus = await rpcStreamController.stream.first;
    var file = File('status.txt');
    file.writeAsBytesSync(rawServerStatus);
    print(Decode.getServices(rawServerStatus));
    return true;
  }
}
