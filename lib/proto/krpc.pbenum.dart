///
//  Generated code. Do not modify.
//  source: krpc.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class ConnectionRequest_Type extends $pb.ProtobufEnum {
  static const ConnectionRequest_Type RPC = ConnectionRequest_Type._(0, 'RPC');
  static const ConnectionRequest_Type STREAM = ConnectionRequest_Type._(1, 'STREAM');

  static const $core.List<ConnectionRequest_Type> values = <ConnectionRequest_Type> [
    RPC,
    STREAM,
  ];

  static final $core.Map<$core.int, ConnectionRequest_Type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ConnectionRequest_Type valueOf($core.int value) => _byValue[value];

  const ConnectionRequest_Type._($core.int v, $core.String n) : super(v, n);
}

class ConnectionResponse_Status extends $pb.ProtobufEnum {
  static const ConnectionResponse_Status OK = ConnectionResponse_Status._(0, 'OK');
  static const ConnectionResponse_Status MALFORMED_MESSAGE = ConnectionResponse_Status._(1, 'MALFORMED_MESSAGE');
  static const ConnectionResponse_Status TIMEOUT = ConnectionResponse_Status._(2, 'TIMEOUT');
  static const ConnectionResponse_Status WRONG_TYPE = ConnectionResponse_Status._(3, 'WRONG_TYPE');

  static const $core.List<ConnectionResponse_Status> values = <ConnectionResponse_Status> [
    OK,
    MALFORMED_MESSAGE,
    TIMEOUT,
    WRONG_TYPE,
  ];

  static final $core.Map<$core.int, ConnectionResponse_Status> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ConnectionResponse_Status valueOf($core.int value) => _byValue[value];

  const ConnectionResponse_Status._($core.int v, $core.String n) : super(v, n);
}

class Procedure_GameScene extends $pb.ProtobufEnum {
  static const Procedure_GameScene SPACE_CENTER = Procedure_GameScene._(0, 'SPACE_CENTER');
  static const Procedure_GameScene FLIGHT = Procedure_GameScene._(1, 'FLIGHT');
  static const Procedure_GameScene TRACKING_STATION = Procedure_GameScene._(2, 'TRACKING_STATION');
  static const Procedure_GameScene EDITOR_VAB = Procedure_GameScene._(3, 'EDITOR_VAB');
  static const Procedure_GameScene EDITOR_SPH = Procedure_GameScene._(4, 'EDITOR_SPH');
  static const Procedure_GameScene MISSION_BUILDER = Procedure_GameScene._(5, 'MISSION_BUILDER');

  static const $core.List<Procedure_GameScene> values = <Procedure_GameScene> [
    SPACE_CENTER,
    FLIGHT,
    TRACKING_STATION,
    EDITOR_VAB,
    EDITOR_SPH,
    MISSION_BUILDER,
  ];

  static final $core.Map<$core.int, Procedure_GameScene> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Procedure_GameScene valueOf($core.int value) => _byValue[value];

  const Procedure_GameScene._($core.int v, $core.String n) : super(v, n);
}

class Type_TypeCode extends $pb.ProtobufEnum {
  static const Type_TypeCode NONE = Type_TypeCode._(0, 'NONE');
  static const Type_TypeCode DOUBLE = Type_TypeCode._(1, 'DOUBLE');
  static const Type_TypeCode FLOAT = Type_TypeCode._(2, 'FLOAT');
  static const Type_TypeCode SINT32 = Type_TypeCode._(3, 'SINT32');
  static const Type_TypeCode SINT64 = Type_TypeCode._(4, 'SINT64');
  static const Type_TypeCode UINT32 = Type_TypeCode._(5, 'UINT32');
  static const Type_TypeCode UINT64 = Type_TypeCode._(6, 'UINT64');
  static const Type_TypeCode BOOL = Type_TypeCode._(7, 'BOOL');
  static const Type_TypeCode STRING = Type_TypeCode._(8, 'STRING');
  static const Type_TypeCode BYTES = Type_TypeCode._(9, 'BYTES');
  static const Type_TypeCode CLASS = Type_TypeCode._(100, 'CLASS');
  static const Type_TypeCode ENUMERATION = Type_TypeCode._(101, 'ENUMERATION');
  static const Type_TypeCode EVENT = Type_TypeCode._(200, 'EVENT');
  static const Type_TypeCode PROCEDURE_CALL = Type_TypeCode._(201, 'PROCEDURE_CALL');
  static const Type_TypeCode STREAM = Type_TypeCode._(202, 'STREAM');
  static const Type_TypeCode STATUS = Type_TypeCode._(203, 'STATUS');
  static const Type_TypeCode SERVICES = Type_TypeCode._(204, 'SERVICES');
  static const Type_TypeCode TUPLE = Type_TypeCode._(300, 'TUPLE');
  static const Type_TypeCode LIST = Type_TypeCode._(301, 'LIST');
  static const Type_TypeCode SET = Type_TypeCode._(302, 'SET');
  static const Type_TypeCode DICTIONARY = Type_TypeCode._(303, 'DICTIONARY');

  static const $core.List<Type_TypeCode> values = <Type_TypeCode> [
    NONE,
    DOUBLE,
    FLOAT,
    SINT32,
    SINT64,
    UINT32,
    UINT64,
    BOOL,
    STRING,
    BYTES,
    CLASS,
    ENUMERATION,
    EVENT,
    PROCEDURE_CALL,
    STREAM,
    STATUS,
    SERVICES,
    TUPLE,
    LIST,
    SET,
    DICTIONARY,
  ];

  static final $core.Map<$core.int, Type_TypeCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Type_TypeCode valueOf($core.int value) => _byValue[value];

  const Type_TypeCode._($core.int v, $core.String n) : super(v, n);
}

