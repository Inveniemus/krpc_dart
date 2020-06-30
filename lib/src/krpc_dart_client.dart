import 'dart:async';
import 'dart:typed_data';

import 'package:krpc_dart/krpc_dart.dart';
import 'package:krpc_dart/proto/krpc.pb.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';

import 'krpc_dart_coder.dart';

enum CONNECTION_STATUS {
  CONNECTED,
  DISCONNECTED,
  ERROR,
}

/// This class manages the kRPC connection and provides interfaces to kRPC
/// services
///
/// Typical use is to invoke and await [connect] method with connection
/// parameters, then send requests and receive answers or stream.
class Client {
  WebSocketChannel _rpcChannel;
  WebSocketChannel _streamChannel;

  StreamController<CONNECTION_STATUS> state;

  // Services
  // todo: make it with builder
  SpaceCenter spaceCenter;
  KRPC krpc;

  Client() {
    // todo: make it with builder
    spaceCenter = SpaceCenter(this);
    krpc = KRPC(this);

    state = StreamController();
    state.add(CONNECTION_STATUS.DISCONNECTED);
  }

  Future<void> connect(
      {String ipAddress = '127.0.0.1',
      int rpcPort = 50000,
      int streamPort = 50001,
      String name = 'dart-krpc'}) async {
    var wsAddress =
        'ws://' + ipAddress + ':' + rpcPort.toString() + '/?name=' + name;
    print('WebSocket address: ' + wsAddress);
    _rpcChannel = IOWebSocketChannel.connect(wsAddress);
  }

  /// Sends an RPC request to kRPC server and wait for an answer if applicable.
  /// [dataCalls] should be:
  /// {'service': <service name, as string>,
  ///  'procedure': <procedure name, as string>,
  ///  'serviceId': <service id, as int>,
  ///  'procedureId': <procedure id, as int>,
  ///  'arguments': [
  ///    {'position': <argument's position, as int>,
  ///     'value': <value, as any type it may have>,
  ///  ],
  /// }
  Future<dynamic> request(
      {List<Map<String, dynamic>> dataCalls}
      ) async {
    _rpcChannel.sink.add(Coder.encodeRequest(dataCalls));
    _rpcChannel.stream.listen((data) {
      if (data is Uint8List) {
        state.add(CONNECTION_STATUS.CONNECTED);
        var response = Response.fromBuffer(data);
        print(response.writeToJsonMap());
        return null;
      } // Normal connection
    }, onError: (error) {
      state.add(CONNECTION_STATUS.ERROR);
      return null;
    }, onDone: () {
      state.add(CONNECTION_STATUS.DISCONNECTED);
      return null;
    });
  }
}
