import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:krpc_dart/exceptions.dart';
import 'package:krpc_dart/krpc_dart.dart';
import 'package:krpc_dart/proto/krpc.pb.dart' show Response, Request, Type, Type_TypeCode;
import 'package:krpc_dart/src/krpc_dart_call_handler.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';

enum CONNECTION_STATUS {
  CONNECTED,
  DISCONNECTED,
  ERROR,
  WAITING,
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

  Stream<dynamic> rpcStream;

  // Services
  // todo: make it with builder
  SpaceCenter spaceCenter;
  KRPC krpc;

  Client() {
    // todo: make it with builder
    spaceCenter = SpaceCenter(this);
    krpc = KRPC(this);

    state = StreamController();
    state.stream.asBroadcastStream().listen((event) => print(event));
    state.add(CONNECTION_STATUS.DISCONNECTED);
  }

  Future<void> connect(
      {String ipAddress = '127.0.0.1',
      int rpcPort = 50000,
      int streamPort = 50001,
      String name = 'dart-krpc'}) async {

    var wsRpcAddress =
        'ws://' + ipAddress + ':' + rpcPort.toString() + '/?name=' + name;
    print('WebSocket address: ' + wsRpcAddress);
    _rpcChannel = IOWebSocketChannel.connect(wsRpcAddress);
    rpcStream = _rpcChannel.stream.asBroadcastStream();

    try {
      print('Getting Client ID for stream connection...');
      var clientId = base64Encode(await krpc.getClientID());
      var wsStreamAddress = 'ws://' + ipAddress + ':' + streamPort.toString() +
          '/?id=' + clientId;
      _streamChannel = IOWebSocketChannel.connect(wsStreamAddress);
      print('Connected!');
    } on WebSocketChannelException {
      throw ConnectionKrpcDartException('Connection error. Check IP and PORT!');
    }
  }

  Future<dynamic> handle(CallMetaData callMetaData) async {
    state.add(CONNECTION_STATUS.WAITING);
    var handler = CallHandler(callMetaData, this);
    print(handler);

    // For now, handling any call as a single request... TODO
    _rpcChannel.sink.add(handler.encodedSingleRequest);
    Uint8List data;
    try {
      data = await rpcStream.first;
      state.add(CONNECTION_STATUS.CONNECTED);
    } catch (error) {
      state.add(CONNECTION_STATUS.ERROR);
      rethrow;
    }

    var returnValue = handler.handleResponse(data);
    return returnValue;
  }
}
