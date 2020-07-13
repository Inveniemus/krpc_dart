abstract class KrpcDartException implements Exception {
  final message;
  KrpcDartException(this.message);
}

class ConnectionKrpcDartException extends KrpcDartException {
  ConnectionKrpcDartException(message) : super(message);

  @override
  String toString() {
    return 'ConnectionKrpcDartException: ' + message;
  }
}

class KrpcError extends KrpcDartException {
  KrpcError(message) : super(message);
}

class KrpcErrorResponse extends KrpcError {
  KrpcErrorResponse(message) : super(message);
}

class KrpcErrorProcedureResult extends KrpcError {
  KrpcErrorProcedureResult(message) : super(message);
}