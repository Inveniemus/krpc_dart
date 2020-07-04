import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:krpc_dart/exceptions.dart';
import 'package:krpc_dart/krpc_dart.dart';
import 'package:krpc_dart/proto/krpc.pb.dart' show Response, Request, Type, Type_TypeCode;
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';

import 'krpc_dart_coder.dart';

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
      var clientId = base64Encode(await krpc.getClientID());
      var wsStreamAddress = 'ws://' + ipAddress + ':' + streamPort.toString() +
          '/?id=' + clientId;
      _streamChannel = IOWebSocketChannel.connect(wsStreamAddress);
    } on WebSocketChannelException {
      throw ConnectionKrpcDartException('Connection error. Check IP and PORT!');
    }
  }

  /// Sends a single RPC request to kRPC server and wait for an answer if applicable.
  /// [callData] should be:
  /// {'service': <service name, as string>,
  ///  'procedure': <procedure name, as string>,
  ///  'serviceId': <service id, as int>,
  ///  'procedureId': <procedure id, as int>,
  ///  'arguments': [
  ///    {'position': <argument's position, as int>,
  ///     'value': <value, as any type it may have>,
  ///  ],
  /// }
  Future<dynamic> singleRequest(
      Map<String, dynamic> callData
      ) async {
    // 1. Encode and send the Request
    state.add(CONNECTION_STATUS.WAITING);
    _rpcChannel.sink.add(Coder.encodeSingleRequest(callData));

    var returnType = callData['return_type'] ?? 'BYTES';
    var returnTypeName = callData['return_type_name'];
    var serviceNameSnakeCase = callData['service_name_snake'];

    // 2. Listen to the channel for a Response
    try {
      Uint8List data = await rpcStream.first;
      state.add(CONNECTION_STATUS.CONNECTED);
      var response = Response.fromBuffer(data);
      if (returnType == 'ENUMERATION' || returnType == 'CLASS') {
        return Coder.decodeSingleResponse(
            response, returnType, returnTypeName, serviceNameSnakeCase);
      }
      return Coder.decodeSingleResponse(response, returnType);
    } catch (error) {
      state.add(CONNECTION_STATUS.ERROR);
      rethrow;
    }
  }
}
