import 'package:bloc_test/bloc_test.dart';
import 'package:krpc_dart/client_bloc/krpc_client_bloc.dart';
import 'package:krpc_dart/domain/connection/connection_parameters.dart';
import 'package:test/test.dart';

void main() {
  final parametersOK = ConnectionParameters()
    ..ip = '192.168.0.150'
    ..port = 50000
    ..clientName = 'Client_test';

  final wrongParameters = ConnectionParameters()
    ..ip = '1.1.1.1'
    ..port = 100;

  blocTest('WebSocket connection test on working KRPC',
      // !!! Put a good ip / port on a running KSP kRPC server
      build: () => KrpcClientBloc(),
      act: (KrpcClientBloc bloc) => bloc
        ..add(WebSocketChannelConnectionRequest(parametersOK))
        ..add(DisconnectRequest()),
      expect: () => [
            KrpcClientConnecting(),
            KrpcClientConnected(),
            KrpcClientDisconnected()
          ]);

  blocTest('WebSocket connection test on erroneous host',
      // !!! Put a good ip / port on a running KSP kRPC server
      build: () => KrpcClientBloc(),
      act: (KrpcClientBloc bloc) => bloc
        ..add(WebSocketChannelConnectionRequest(wrongParameters)),
      expect: () => [
        KrpcClientConnecting(),
        throwsException,
      ]);
}
