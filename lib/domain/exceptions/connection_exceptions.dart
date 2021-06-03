class KrpcClientException implements Exception {
  final String message;
  KrpcClientException(this.message);
}