import 'dart:typed_data';
import 'krpc_dart_coder.dart' show Coder;

/// Structure to deal with call metadata.
/// [_serviceName] is the name of the service as defined by the server, e.g.
/// "KRPC" or "SpaceCenter". Case is important!
/// [_procedureName] same as above...
/// [_returnType] same as above, used to configure CallHandler for the eventual
/// result.
/// [_argumentsMetaData] is a list of [ArgumentMetaData] instances.
class CallMetaData {
  final String _serviceName;
  final String _procedureName;
  final String _returnType;
  final List<ArgumentMetaData> _argumentsMetaData;

  CallMetaData(this._serviceName, this._procedureName, this._returnType,
    this._argumentsMetaData
  );

  String get serviceName => _serviceName;
  String get procedureName => _procedureName;
  String get returnType => _returnType;
  List<ArgumentMetaData> get argumentsMetaData => _argumentsMetaData;

  @override
  String toString() {
    return '\nCALL: (service)${_serviceName} (procedure)${_procedureName}\n'
        '  EXPECTED RETURN: (type)${_returnType}\n'
        '  ARGUMENTS: ${_argumentsMetaData}';
  }
}

/// Structure to deal with argument metadata.
class ArgumentMetaData {
  final int _position;
  Uint8List _value;

  ArgumentMetaData(this._position);

  int get position => _position;
  Uint8List get value => _value;

  @override
  String toString() {
    return '${_position}';
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

  CallHandler(this._callMetaData) : _coder = Coder();

  Uint8List get encodedCall => _coder.encodeCall(_callMetaData);
  Uint8List get encodedSingleRequest =>
      _coder.encodeCallAsSingleRequest(_callMetaData);

  dynamic handleResponse(dynamic response) {
    return _coder.decodeResponse(response);
  }

  @override
  String toString() {
    return 'HANDLING: ${_callMetaData}';
  }
}