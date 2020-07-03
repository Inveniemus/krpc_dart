abstract class KrpcDartException implements Exception {
  final message;
  KrpcDartException(this.message);
}

class ConnectionKrpcDartException extends KrpcDartException {
  ConnectionKrpcDartException(message) : super(message);
}