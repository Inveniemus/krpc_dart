class KrpcConnectionError implements Exception {
  final message;
  KrpcConnectionError(this.message);

  @override
  String toString() => 'KrpcConnectionError: $message';
}

class KrpcServerError implements Exception {
  final String serviceName;
  final String name;
  final String description;
  final String stackTrace;
  KrpcServerError(this.serviceName, this.name, this.description, this.stackTrace);

  @override
  String toString() {
    return 'SERVICE: $serviceName\nERROR NAME: $name\nDESCRIPTION: $description'
        '\nSTACK TRACE: $stackTrace';
  }
}