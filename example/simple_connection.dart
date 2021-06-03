import 'dart:io';

import 'package:krpc_dart/client_bloc/krpc_client_bloc.dart';
import 'package:krpc_dart/domain/connection/connection_parameters.dart';
import 'package:krpc_dart/proto/krpc.pb.dart';
import 'package:krpc_dart/proto/krpc.pbserver.dart';

void main() async {
  final connectionBloc = KrpcClientBloc();
  connectionBloc.add(WebSocketChannelConnectionRequest(ConnectionParameters()..ip = '192.168.0.150'..port = 50000..clientName = 'Test'));
  final statusRequest = Request();
  statusRequest.calls
    ..add(ProcedureCall()..service = 'SpaceCenters'..procedure = 'get_ActiveVessel')
    ..add(ProcedureCall()..service = 'SpaceCenter'..procedure = 'get_ActiveVessel')
    ..add(ProcedureCall()..service = 'SpaceCenter'..procedure = 'get_Vessels')
    ..add(ProcedureCall()..service = 'SpaceCenter'..procedure = 'get_Vessel')
    ..add(ProcedureCall()..service = 'SpaceCenter'..procedure = 'get_Bodies');
  connectionBloc.add(RpcRequest(statusRequest.writeToBuffer()));
  connectionBloc.stream.listen((state) {
    if (state is KrpcClientRpcResponse) {
      final response = Response.fromBuffer(state.data);
      print(response);
    }
  });


  sleep(Duration(seconds: 1));
  connectionBloc.add(DisconnectRequest());
  return;
}