import 'package:krpc_dart/client_bloc/krpc_client_bloc.dart';
import 'package:krpc_dart/domain/connection/connection_parameters.dart';
import 'package:krpc_dart/proto/krpc.pb.dart';

void main() async {
  final connectionBloc = KrpcClientBloc();
  connectionBloc.add(WebSocketChannelConnectionRequest(ConnectionParameters()..ip = '192.168.0.150'..port = 50000..clientName = 'Test'));
  final statusRequest = Request()
    ..calls.add(ProcedureCall()..service = 'KRPC'..procedure = 'GetServices');
  connectionBloc.add(RpcRequest(statusRequest.writeToBuffer()));
  connectionBloc.stream.listen((state) {
    if (state is KrpcClientRpcResponse) {
      final response = Response.fromBuffer(state.data);
      final services = Services.fromBuffer(response.results[0].value);
      print('SERVICES:');
      services.services.forEach((Service service) {
        print(service.name);
      });

      final spaceCenterService = services.services.firstWhere((service) => service.name == 'SpaceCenter');
      print('\nSpaceCenter service procedures:');
      spaceCenterService.procedures.forEach((procedure) => print(procedure.name));
    }
  });
  return;
}