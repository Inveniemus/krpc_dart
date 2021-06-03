part of 'krpc_client_bloc.dart';

abstract class KrpcClientState extends Equatable {
  const KrpcClientState();
}

class KrpcClientDisconnected extends KrpcClientState {
  @override
  List<Object> get props => [];
}

class KrpcClientConnecting extends KrpcClientState {
  @override
  List<Object> get props => [];
}

class KrpcClientConnected extends KrpcClientState {
  @override
  List<Object> get props => [];
}

class KrpcClientError extends KrpcClientState {
  final String message;
  KrpcClientError(this.message) {
    print('kRPC Client connection ERROR: $message');
  }
  @override
  List<Object> get props => [message];
}

class KrpcClientRpcResponse extends KrpcClientState {
  final Uint8List data;
  const KrpcClientRpcResponse(this.data);
  @override
  List<Object?> get props => [data];
}
