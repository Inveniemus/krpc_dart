import 'dart:typed_data';
import 'krpc_dart_coder.dart' show Coder;
import 'krpc_dart_client.dart' show Client;

/// Structure to deal with call metadata.
/// [_serviceName] is the name of the service as defined by the server, e.g.
/// "KRPC" or "SpaceCenter". Case is important!
/// [_procedureName] same as above...
/// [_krpcReturnType] same as above, used to configure CallHandler for the eventual
/// result.
/// [_argumentsMetaData] is a list of [ArgumentMetaData] instances.
class CallMetaData {
  final String _serviceName;
  final String _procedureName;
  final String _krpcReturnType;
  final String _dartReturnType;
  final String _libraryName;
  final Uint8List _classReference;
  final List<ArgumentMetaData> _argumentsMetaData;

  CallMetaData(this._serviceName, this._procedureName, this._krpcReturnType, this._dartReturnType, this._libraryName, this._classReference,
    this._argumentsMetaData
  );

  String get serviceName => _serviceName;
  String get procedureName => _procedureName;
  String get krpcReturnType => _krpcReturnType;
  String get dartReturnType => _dartReturnType;
  String get libraryName => _libraryName;
  Uint8List get classReference => _classReference;
  List<ArgumentMetaData> get argumentsMetaData => _argumentsMetaData;

  @override
  String toString() {
    return '\nCALL: (service)${_serviceName} (procedure)${_procedureName}\n'
        '  EXPECTED RETURN: (type)${_krpcReturnType}\n'
        '  ARGUMENTS: ${_argumentsMetaData}';
  }
}

/// Structure to deal with argument metadata.
class ArgumentMetaData {
  final int _position;
  final String _krpcType;
  final dynamic _value;

  ArgumentMetaData(this._position, this._krpcType, this._value);

  int get position => _position;
  String get krpcType => _krpcType;
  dynamic get value => _value;

  @override
  String toString() {
    return '${_position} - ${_krpcType} - ${_value}';
  }
}

/// The call handler is used to link library methods to the client.
///
/// It is responsible to collect call metadata for the encoder to build the
/// fully encoded Request, and to pre-configure the decoder before the Response
/// is obtained and then decoded, then finally returned by the original
/// library function or method.
class CallHandler {
  final CallMetaData _callMetaData;
  final Coder _coder;
  final Client _client;

  CallHandler(this._callMetaData, this._client) : _coder = Coder(_client);

  Uint8List get encodedCall => _coder.encodeCall(_callMetaData);
  Uint8List get encodedSingleRequest =>
      _coder.encodeCallAsSingleRequest(_callMetaData);

  dynamic handleResponse(Uint8List data) {
    return _coder.decodeResponse(data);
  }

  @override
  String toString() {
    return 'HANDLING: ${_callMetaData}';
  }
}