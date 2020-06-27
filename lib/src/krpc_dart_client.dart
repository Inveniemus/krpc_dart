import 'dart:async';
import 'dart:typed_data';

import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';

import 'krpc_dart_coder.dart';

enum CONNECTION_STATUS {
  CONNECTED,
  DISCONNECTED,
  ERROR,
}

/// This class manages the kRPC connection and provides interfaces for protobuf
/// "raw data", [Uint8List] stuff, through 2 channels, 'rpc' and 'stream'.
///
/// Typical use is to invoke and await [connect] method with connection
/// parameters, then send requests and receive answers or stream.
class Client {

  WebSocketChannel _rpcChannel;
  WebSocketChannel _streamChannel;

  StreamController<Uint8List> rpc;
  StreamController<CONNECTION_STATUS> state;

  Client() {
    state = StreamController();
    rpc = StreamController();
    state.add(CONNECTION_STATUS.DISCONNECTED);
  }


  Future<void> connect({
      String ipAddress = '127.0.0.1',
      int rpcPort = 50000,
      String name = 'dart-krpc'
    }) async {

    var wsAddress = 'ws://' + ipAddress + ':' + rpcPort.toString() +
        '/?name=' + name;
    print('WebSocket address: ' + wsAddress);
    _rpcChannel = IOWebSocketChannel.connect(wsAddress);

    _rpcChannel.stream.listen(
      (data) {
        if (data is Uint8List) {
          state.add(CONNECTION_STATUS.CONNECTED);
          rpc.add(data);
        }  // Normal connection
      }, onError: (error) {
        state.add(CONNECTION_STATUS.ERROR);
      }, onDone: () => state.add(CONNECTION_STATUS.DISCONNECTED)
    );

    sendRpc(Coder.ClientIDRequest());

  }

  void sendRpc(Uint8List data) {
    _rpcChannel.sink.add(data);
  }
}
