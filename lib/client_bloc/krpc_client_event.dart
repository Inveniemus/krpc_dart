part of 'krpc_client_bloc.dart';

abstract class KrpcClientEvent extends Equatable {
  const KrpcClientEvent();
}

class TcpConnectionRequest extends KrpcClientEvent {
  final ConnectionParameters parameters;
  const TcpConnectionRequest(this.parameters);

  @override
  List<Object?> get props => [parameters];
}

class WebSocketChannelConnectionRequest extends KrpcClientEvent {
  final ConnectionParameters parameters;
  const WebSocketChannelConnectionRequest(this.parameters);

  @override
  List<Object?> get props => [parameters];
}

class DisconnectRequest extends KrpcClientEvent {
  @override
  List<Object?> get props => [];
}

class RpcRequest extends KrpcClientEvent {
  final Uint8List data;
  const RpcRequest(this.data);
  @override
  List<Object?> get props => [data];
}
