class KrpcConnectionError implements Exception {
  final message;
  KrpcConnectionError(this.message);

  @override
  String toString() => 'KrpcConnectionError: $message';
}