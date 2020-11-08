import 'package:meta/meta.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// The client to connect to the kRPC server inside KSP
///
/// It is responsible to send and receive protobuf data RPCs and streams.
/// It can request the necessary "kRPC services" to build the library.
/// It has to be referenced by the library generated objects, in order to call
/// their methods (a.k.a as Procedure in kRPC nomenclature).
class KrpcClient {
  WebSocketChannel rpcChannel;
  WebSocketChannel streamChannel;

  KrpcClient.connect(
      {String ip = 'localhost',
      int rpcPort = 50000,
      int streamPort = 50001,
      String clientName = 'krpc-dart'}) {
    var rpcUrl = 'ws://$ip:$rpcPort/?name=$clientName';
    print('Connecting to WebSocket: $rpcUrl');
    rpcChannel = IOWebSocketChannel.connect(rpcUrl);

    var clientId =
    var streamUrl = 'ws://$ip:$streamPort/?id=$clientId';
    streamChannel = IOWebSocketChannel.connect(streamUrl);
  }
}
