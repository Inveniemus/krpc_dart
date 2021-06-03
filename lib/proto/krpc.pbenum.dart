///
//  Generated code. Do not modify.
//  source: krpc.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class ConnectionRequest_Type extends $pb.ProtobufEnum {
  static const ConnectionRequest_Type RPC = ConnectionRequest_Type._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RPC');
  static const ConnectionRequest_Type STREAM = ConnectionRequest_Type._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'STREAM');

  static const $core.List<ConnectionRequest_Type> values = <ConnectionRequest_Type> [
    RPC,
    STREAM,
  ];

  static final $core.Map<$core.int, ConnectionRequest_Type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ConnectionRequest_Type? valueOf($core.int value) => _byValue[value];

  const ConnectionRequest_Type._($core.int v, $core.String n) : super(v, n);
}

class ConnectionResponse_Status extends $pb.ProtobufEnum {
  static const ConnectionResponse_Status OK = ConnectionResponse_Status._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OK');
  static const ConnectionResponse_Status MALFORMED_MESSAGE = ConnectionResponse_Status._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MALFORMED_MESSAGE');
  static const ConnectionResponse_Status TIMEOUT = ConnectionResponse_Status._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TIMEOUT');
  static const ConnectionResponse_Status WRONG_TYPE = ConnectionResponse_Status._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WRONG_TYPE');

  static const $core.List<ConnectionResponse_Status> values = <ConnectionResponse_Status> [
    OK,
    MALFORMED_MESSAGE,
    TIMEOUT,
    WRONG_TYPE,
  ];

  static final $core.Map<$core.int, ConnectionResponse_Status> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ConnectionResponse_Status? valueOf($core.int value) => _byValue[value];

  const ConnectionResponse_Status._($core.int v, $core.String n) : super(v, n);
}

class Procedure_GameScene extends $pb.ProtobufEnum {
  static const Procedure_GameScene SPACE_CENTER = Procedure_GameScene._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SPACE_CENTER');
  static const Procedure_GameScene FLIGHT = Procedure_GameScene._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FLIGHT');
  static const Procedure_GameScene TRACKING_STATION = Procedure_GameScene._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TRACKING_STATION');
  static const Procedure_GameScene EDITOR_VAB = Procedure_GameScene._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'EDITOR_VAB');
  static const Procedure_GameScene EDITOR_SPH = Procedure_GameScene._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'EDITOR_SPH');
  static const Procedure_GameScene MISSION_BUILDER = Procedure_GameScene._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MISSION_BUILDER');

  static const $core.List<Procedure_GameScene> values = <Procedure_GameScene> [
    SPACE_CENTER,
    FLIGHT,
    TRACKING_STATION,
    EDITOR_VAB,
    EDITOR_SPH,
    MISSION_BUILDER,
  ];

  static final $core.Map<$core.int, Procedure_GameScene> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Procedure_GameScene? valueOf($core.int value) => _byValue[value];

  const Procedure_GameScene._($core.int v, $core.String n) : super(v, n);
}

class Type_TypeCode extends $pb.ProtobufEnum {
  static const Type_TypeCode NONE = Type_TypeCode._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NONE');
  static const Type_TypeCode DOUBLE = Type_TypeCode._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DOUBLE');
  static const Type_TypeCode FLOAT = Type_TypeCode._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FLOAT');
  static const Type_TypeCode SINT32 = Type_TypeCode._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SINT32');
  static const Type_TypeCode SINT64 = Type_TypeCode._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SINT64');
  static const Type_TypeCode UINT32 = Type_TypeCode._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UINT32');
  static const Type_TypeCode UINT64 = Type_TypeCode._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UINT64');
  static const Type_TypeCode BOOL = Type_TypeCode._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BOOL');
  static const Type_TypeCode STRING = Type_TypeCode._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'STRING');
  static const Type_TypeCode BYTES = Type_TypeCode._(9, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BYTES');
  static const Type_TypeCode CLASS = Type_TypeCode._(100, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CLASS');
  static const Type_TypeCode ENUMERATION = Type_TypeCode._(101, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ENUMERATION');
  static const Type_TypeCode EVENT = Type_TypeCode._(200, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'EVENT');
  static const Type_TypeCode PROCEDURE_CALL = Type_TypeCode._(201, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PROCEDURE_CALL');
  static const Type_TypeCode STREAM = Type_TypeCode._(202, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'STREAM');
  static const Type_TypeCode STATUS = Type_TypeCode._(203, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'STATUS');
  static const Type_TypeCode SERVICES = Type_TypeCode._(204, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SERVICES');
  static const Type_TypeCode TUPLE = Type_TypeCode._(300, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TUPLE');
  static const Type_TypeCode LIST = Type_TypeCode._(301, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LIST');
  static const Type_TypeCode SET = Type_TypeCode._(302, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SET');
  static const Type_TypeCode DICTIONARY = Type_TypeCode._(303, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DICTIONARY');

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
  static Type_TypeCode? valueOf($core.int value) => _byValue[value];

  const Type_TypeCode._($core.int v, $core.String n) : super(v, n);
}

