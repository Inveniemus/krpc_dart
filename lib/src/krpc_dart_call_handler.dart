import 'dart:typed_data';

/// Structure to deal with a call metadata. Used to avoid Map<String, dynamic>
/// ugly code.
class CallMetaData {
  final String _serviceName;
  final String _procedureName;

  List<ArgumentMetaData> _argumentsMetaData;

  CallMetaData(this._serviceName, this._procedureName);

  String get serviceName => _serviceName;
  String get procedureName => _procedureName;
}

/// Structure to deal with aa argument metadata. Used to avoid
/// Map<String, dynamic> ugly code.
class ArgumentMetaData {
  final int _position;
  Uint8List _value;

  ArgumentMetaData(this._position);

  int get position => _position;
  Uint8List get value => _value;
}

/// The call handler is used to link library methods to the client.
///
/// It is responsible to collect call metadata for the encoder to build the
/// fully encoded Request, and to pre-configure the decoder before the Response
/// is obtained and then decoded, then finally returned by the original
/// library function or method.
class CallHandler {
  final CallMetaData _callMetaData;

  CallHandler(this._callMetaData);
}