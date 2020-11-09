///
//  Generated code. Do not modify.
//  source: krpc.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'krpc.pbenum.dart';

export 'krpc.pbenum.dart';

class ConnectionRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ConnectionRequest',
      package: const $pb.PackageName('krpc.schema'),
      createEmptyInstance: create)
    ..e<ConnectionRequest_Type>(1, 'type', $pb.PbFieldType.OE,
        defaultOrMaker: ConnectionRequest_Type.RPC,
        valueOf: ConnectionRequest_Type.valueOf,
        enumValues: ConnectionRequest_Type.values)
    ..aOS(2, 'clientName')
    ..a<$core.List<$core.int>>(3, 'clientIdentifier', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  ConnectionRequest._() : super();

  factory ConnectionRequest() => create();

  factory ConnectionRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory ConnectionRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  ConnectionRequest clone() => ConnectionRequest()..mergeFromMessage(this);

  ConnectionRequest copyWith(void Function(ConnectionRequest) updates) =>
      super.copyWith((message) => updates(message as ConnectionRequest));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConnectionRequest create() => ConnectionRequest._();

  ConnectionRequest createEmptyInstance() => create();

  static $pb.PbList<ConnectionRequest> createRepeated() =>
      $pb.PbList<ConnectionRequest>();

  @$core.pragma('dart2js:noInline')
  static ConnectionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConnectionRequest>(create);
  static ConnectionRequest _defaultInstance;

  @$pb.TagNumber(1)
  ConnectionRequest_Type get type => $_getN(0);

  @$pb.TagNumber(1)
  set type(ConnectionRequest_Type v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);

  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get clientName => $_getSZ(1);

  @$pb.TagNumber(2)
  set clientName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasClientName() => $_has(1);

  @$pb.TagNumber(2)
  void clearClientName() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get clientIdentifier => $_getN(2);

  @$pb.TagNumber(3)
  set clientIdentifier($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasClientIdentifier() => $_has(2);

  @$pb.TagNumber(3)
  void clearClientIdentifier() => clearField(3);
}

class ConnectionResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ConnectionResponse',
      package: const $pb.PackageName('krpc.schema'),
      createEmptyInstance: create)
    ..e<ConnectionResponse_Status>(1, 'status', $pb.PbFieldType.OE,
        defaultOrMaker: ConnectionResponse_Status.OK,
        valueOf: ConnectionResponse_Status.valueOf,
        enumValues: ConnectionResponse_Status.values)
    ..aOS(2, 'message')
    ..a<$core.List<$core.int>>(3, 'clientIdentifier', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  ConnectionResponse._() : super();

  factory ConnectionResponse() => create();

  factory ConnectionResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory ConnectionResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  ConnectionResponse clone() => ConnectionResponse()..mergeFromMessage(this);

  ConnectionResponse copyWith(void Function(ConnectionResponse) updates) =>
      super.copyWith((message) => updates(message as ConnectionResponse));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConnectionResponse create() => ConnectionResponse._();

  ConnectionResponse createEmptyInstance() => create();

  static $pb.PbList<ConnectionResponse> createRepeated() =>
      $pb.PbList<ConnectionResponse>();

  @$core.pragma('dart2js:noInline')
  static ConnectionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConnectionResponse>(create);
  static ConnectionResponse _defaultInstance;

  @$pb.TagNumber(1)
  ConnectionResponse_Status get status => $_getN(0);

  @$pb.TagNumber(1)
  set status(ConnectionResponse_Status v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);

  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);

  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);

  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get clientIdentifier => $_getN(2);

  @$pb.TagNumber(3)
  set clientIdentifier($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasClientIdentifier() => $_has(2);

  @$pb.TagNumber(3)
  void clearClientIdentifier() => clearField(3);
}

class Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Request',
      package: const $pb.PackageName('krpc.schema'),
      createEmptyInstance: create)
    ..pc<ProcedureCall>(1, 'calls', $pb.PbFieldType.PM,
        subBuilder: ProcedureCall.create)
    ..hasRequiredFields = false;

  Request._() : super();

  factory Request() => create();

  factory Request.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory Request.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  Request clone() => Request()..mergeFromMessage(this);

  Request copyWith(void Function(Request) updates) =>
      super.copyWith((message) => updates(message as Request));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Request create() => Request._();

  Request createEmptyInstance() => create();

  static $pb.PbList<Request> createRepeated() => $pb.PbList<Request>();

  @$core.pragma('dart2js:noInline')
  static Request getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Request>(create);
  static Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ProcedureCall> get calls => $_getList(0);
}

class ProcedureCall extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ProcedureCall',
      package: const $pb.PackageName('krpc.schema'),
      createEmptyInstance: create)
    ..aOS(1, 'service')
    ..aOS(2, 'procedure')
    ..pc<Argument>(3, 'arguments', $pb.PbFieldType.PM,
        subBuilder: Argument.create)
    ..a<$core.int>(4, 'serviceId', $pb.PbFieldType.OU3)
    ..a<$core.int>(5, 'procedureId', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ProcedureCall._() : super();

  factory ProcedureCall() => create();

  factory ProcedureCall.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory ProcedureCall.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  ProcedureCall clone() => ProcedureCall()..mergeFromMessage(this);

  ProcedureCall copyWith(void Function(ProcedureCall) updates) =>
      super.copyWith((message) => updates(message as ProcedureCall));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProcedureCall create() => ProcedureCall._();

  ProcedureCall createEmptyInstance() => create();

  static $pb.PbList<ProcedureCall> createRepeated() =>
      $pb.PbList<ProcedureCall>();

  @$core.pragma('dart2js:noInline')
  static ProcedureCall getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProcedureCall>(create);
  static ProcedureCall _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get service => $_getSZ(0);

  @$pb.TagNumber(1)
  set service($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasService() => $_has(0);

  @$pb.TagNumber(1)
  void clearService() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get procedure => $_getSZ(1);

  @$pb.TagNumber(2)
  set procedure($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasProcedure() => $_has(1);

  @$pb.TagNumber(2)
  void clearProcedure() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<Argument> get arguments => $_getList(2);

  @$pb.TagNumber(4)
  $core.int get serviceId => $_getIZ(3);

  @$pb.TagNumber(4)
  set serviceId($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasServiceId() => $_has(3);

  @$pb.TagNumber(4)
  void clearServiceId() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get procedureId => $_getIZ(4);

  @$pb.TagNumber(5)
  set procedureId($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasProcedureId() => $_has(4);

  @$pb.TagNumber(5)
  void clearProcedureId() => clearField(5);
}

class Argument extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Argument',
      package: const $pb.PackageName('krpc.schema'),
      createEmptyInstance: create)
    ..a<$core.int>(1, 'position', $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(2, 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  Argument._() : super();

  factory Argument() => create();

  factory Argument.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory Argument.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  Argument clone() => Argument()..mergeFromMessage(this);

  Argument copyWith(void Function(Argument) updates) =>
      super.copyWith((message) => updates(message as Argument));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Argument create() => Argument._();

  Argument createEmptyInstance() => create();

  static $pb.PbList<Argument> createRepeated() => $pb.PbList<Argument>();

  @$core.pragma('dart2js:noInline')
  static Argument getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Argument>(create);
  static Argument _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get position => $_getIZ(0);

  @$pb.TagNumber(1)
  set position($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPosition() => $_has(0);

  @$pb.TagNumber(1)
  void clearPosition() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get value => $_getN(1);

  @$pb.TagNumber(2)
  set value($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);

  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
}

class Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Response',
      package: const $pb.PackageName('krpc.schema'),
      createEmptyInstance: create)
    ..aOM<Error>(1, 'error', subBuilder: Error.create)
    ..pc<ProcedureResult>(2, 'results', $pb.PbFieldType.PM,
        subBuilder: ProcedureResult.create)
    ..hasRequiredFields = false;

  Response._() : super();

  factory Response() => create();

  factory Response.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory Response.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  Response clone() => Response()..mergeFromMessage(this);

  Response copyWith(void Function(Response) updates) =>
      super.copyWith((message) => updates(message as Response));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Response create() => Response._();

  Response createEmptyInstance() => create();

  static $pb.PbList<Response> createRepeated() => $pb.PbList<Response>();

  @$core.pragma('dart2js:noInline')
  static Response getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Response>(create);
  static Response _defaultInstance;

  @$pb.TagNumber(1)
  Error get error => $_getN(0);

  @$pb.TagNumber(1)
  set error(Error v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasError() => $_has(0);

  @$pb.TagNumber(1)
  void clearError() => clearField(1);

  @$pb.TagNumber(1)
  Error ensureError() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<ProcedureResult> get results => $_getList(1);
}

class ProcedureResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ProcedureResult',
      package: const $pb.PackageName('krpc.schema'),
      createEmptyInstance: create)
    ..aOM<Error>(1, 'error', subBuilder: Error.create)
    ..a<$core.List<$core.int>>(2, 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  ProcedureResult._() : super();

  factory ProcedureResult() => create();

  factory ProcedureResult.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory ProcedureResult.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  ProcedureResult clone() => ProcedureResult()..mergeFromMessage(this);

  ProcedureResult copyWith(void Function(ProcedureResult) updates) =>
      super.copyWith((message) => updates(message as ProcedureResult));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProcedureResult create() => ProcedureResult._();

  ProcedureResult createEmptyInstance() => create();

  static $pb.PbList<ProcedureResult> createRepeated() =>
      $pb.PbList<ProcedureResult>();

  @$core.pragma('dart2js:noInline')
  static ProcedureResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProcedureResult>(create);
  static ProcedureResult _defaultInstance;

  @$pb.TagNumber(1)
  Error get error => $_getN(0);

  @$pb.TagNumber(1)
  set error(Error v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasError() => $_has(0);

  @$pb.TagNumber(1)
  void clearError() => clearField(1);

  @$pb.TagNumber(1)
  Error ensureError() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get value => $_getN(1);

  @$pb.TagNumber(2)
  set value($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);

  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
}

class Error extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Error',
      package: const $pb.PackageName('krpc.schema'),
      createEmptyInstance: create)
    ..aOS(1, 'service')
    ..aOS(2, 'name')
    ..aOS(3, 'description')
    ..aOS(4, 'stackTrace')
    ..hasRequiredFields = false;

  Error._() : super();

  factory Error() => create();

  factory Error.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory Error.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  Error clone() => Error()..mergeFromMessage(this);

  Error copyWith(void Function(Error) updates) =>
      super.copyWith((message) => updates(message as Error));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Error create() => Error._();

  Error createEmptyInstance() => create();

  static $pb.PbList<Error> createRepeated() => $pb.PbList<Error>();

  @$core.pragma('dart2js:noInline')
  static Error getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Error>(create);
  static Error _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get service => $_getSZ(0);

  @$pb.TagNumber(1)
  set service($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasService() => $_has(0);

  @$pb.TagNumber(1)
  void clearService() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);

  @$pb.TagNumber(2)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);

  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);

  @$pb.TagNumber(3)
  set description($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);

  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get stackTrace => $_getSZ(3);

  @$pb.TagNumber(4)
  set stackTrace($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasStackTrace() => $_has(3);

  @$pb.TagNumber(4)
  void clearStackTrace() => clearField(4);
}

class StreamUpdate extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('StreamUpdate',
      package: const $pb.PackageName('krpc.schema'),
      createEmptyInstance: create)
    ..pc<StreamResult>(1, 'results', $pb.PbFieldType.PM,
        subBuilder: StreamResult.create)
    ..hasRequiredFields = false;

  StreamUpdate._() : super();

  factory StreamUpdate() => create();

  factory StreamUpdate.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory StreamUpdate.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  StreamUpdate clone() => StreamUpdate()..mergeFromMessage(this);

  StreamUpdate copyWith(void Function(StreamUpdate) updates) =>
      super.copyWith((message) => updates(message as StreamUpdate));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StreamUpdate create() => StreamUpdate._();

  StreamUpdate createEmptyInstance() => create();

  static $pb.PbList<StreamUpdate> createRepeated() =>
      $pb.PbList<StreamUpdate>();

  @$core.pragma('dart2js:noInline')
  static StreamUpdate getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StreamUpdate>(create);
  static StreamUpdate _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<StreamResult> get results => $_getList(0);
}

class StreamResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('StreamResult',
      package: const $pb.PackageName('krpc.schema'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<ProcedureResult>(2, 'result', subBuilder: ProcedureResult.create)
    ..hasRequiredFields = false;

  StreamResult._() : super();

  factory StreamResult() => create();

  factory StreamResult.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory StreamResult.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  StreamResult clone() => StreamResult()..mergeFromMessage(this);

  StreamResult copyWith(void Function(StreamResult) updates) =>
      super.copyWith((message) => updates(message as StreamResult));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StreamResult create() => StreamResult._();

  StreamResult createEmptyInstance() => create();

  static $pb.PbList<StreamResult> createRepeated() =>
      $pb.PbList<StreamResult>();

  @$core.pragma('dart2js:noInline')
  static StreamResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StreamResult>(create);
  static StreamResult _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);

  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);

  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  ProcedureResult get result => $_getN(1);

  @$pb.TagNumber(2)
  set result(ProcedureResult v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasResult() => $_has(1);

  @$pb.TagNumber(2)
  void clearResult() => clearField(2);

  @$pb.TagNumber(2)
  ProcedureResult ensureResult() => $_ensure(1);
}

class Services extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Services',
      package: const $pb.PackageName('krpc.schema'),
      createEmptyInstance: create)
    ..pc<Service>(1, 'services', $pb.PbFieldType.PM, subBuilder: Service.create)
    ..hasRequiredFields = false;

  Services._() : super();

  factory Services() => create();

  factory Services.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory Services.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  Services clone() => Services()..mergeFromMessage(this);

  Services copyWith(void Function(Services) updates) =>
      super.copyWith((message) => updates(message as Services));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Services create() => Services._();

  Services createEmptyInstance() => create();

  static $pb.PbList<Services> createRepeated() => $pb.PbList<Services>();

  @$core.pragma('dart2js:noInline')
  static Services getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Services>(create);
  static Services _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Service> get services => $_getList(0);
}

class Service extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Service',
      package: const $pb.PackageName('krpc.schema'),
      createEmptyInstance: create)
    ..aOS(1, 'name')
    ..pc<Procedure>(2, 'procedures', $pb.PbFieldType.PM,
        subBuilder: Procedure.create)
    ..pc<Class>(3, 'classes', $pb.PbFieldType.PM, subBuilder: Class.create)
    ..pc<Enumeration>(4, 'enumerations', $pb.PbFieldType.PM,
        subBuilder: Enumeration.create)
    ..pc<Exception>(5, 'exceptions', $pb.PbFieldType.PM,
        subBuilder: Exception.create)
    ..aOS(6, 'documentation')
    ..hasRequiredFields = false;

  Service._() : super();

  factory Service() => create();

  factory Service.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory Service.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  Service clone() => Service()..mergeFromMessage(this);

  Service copyWith(void Function(Service) updates) =>
      super.copyWith((message) => updates(message as Service));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Service create() => Service._();

  Service createEmptyInstance() => create();

  static $pb.PbList<Service> createRepeated() => $pb.PbList<Service>();

  @$core.pragma('dart2js:noInline')
  static Service getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Service>(create);
  static Service _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);

  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);

  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<Procedure> get procedures => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<Class> get classes => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<Enumeration> get enumerations => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<Exception> get exceptions => $_getList(4);

  @$pb.TagNumber(6)
  $core.String get documentation => $_getSZ(5);

  @$pb.TagNumber(6)
  set documentation($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDocumentation() => $_has(5);

  @$pb.TagNumber(6)
  void clearDocumentation() => clearField(6);
}

class Procedure extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Procedure',
      package: const $pb.PackageName('krpc.schema'),
      createEmptyInstance: create)
    ..aOS(1, 'name')
    ..pc<Parameter>(2, 'parameters', $pb.PbFieldType.PM,
        subBuilder: Parameter.create)
    ..aOM<Type>(3, 'returnType', subBuilder: Type.create)
    ..aOB(4, 'returnIsNullable')
    ..aOS(5, 'documentation')
    ..pc<Procedure_GameScene>(6, 'gameScenes', $pb.PbFieldType.PE,
        valueOf: Procedure_GameScene.valueOf,
        enumValues: Procedure_GameScene.values)
    ..hasRequiredFields = false;

  Procedure._() : super();

  factory Procedure() => create();

  factory Procedure.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory Procedure.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  Procedure clone() => Procedure()..mergeFromMessage(this);

  Procedure copyWith(void Function(Procedure) updates) =>
      super.copyWith((message) => updates(message as Procedure));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Procedure create() => Procedure._();

  Procedure createEmptyInstance() => create();

  static $pb.PbList<Procedure> createRepeated() => $pb.PbList<Procedure>();

  @$core.pragma('dart2js:noInline')
  static Procedure getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Procedure>(create);
  static Procedure _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);

  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);

  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<Parameter> get parameters => $_getList(1);

  @$pb.TagNumber(3)
  Type get returnType => $_getN(2);

  @$pb.TagNumber(3)
  set returnType(Type v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasReturnType() => $_has(2);

  @$pb.TagNumber(3)
  void clearReturnType() => clearField(3);

  @$pb.TagNumber(3)
  Type ensureReturnType() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.bool get returnIsNullable => $_getBF(3);

  @$pb.TagNumber(4)
  set returnIsNullable($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasReturnIsNullable() => $_has(3);

  @$pb.TagNumber(4)
  void clearReturnIsNullable() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get documentation => $_getSZ(4);

  @$pb.TagNumber(5)
  set documentation($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDocumentation() => $_has(4);

  @$pb.TagNumber(5)
  void clearDocumentation() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<Procedure_GameScene> get gameScenes => $_getList(5);
}

class Parameter extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Parameter',
      package: const $pb.PackageName('krpc.schema'),
      createEmptyInstance: create)
    ..aOS(1, 'name')
    ..aOM<Type>(2, 'type', subBuilder: Type.create)
    ..a<$core.List<$core.int>>(3, 'defaultValue', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  Parameter._() : super();

  factory Parameter() => create();

  factory Parameter.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory Parameter.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  Parameter clone() => Parameter()..mergeFromMessage(this);

  Parameter copyWith(void Function(Parameter) updates) =>
      super.copyWith((message) => updates(message as Parameter));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Parameter create() => Parameter._();

  Parameter createEmptyInstance() => create();

  static $pb.PbList<Parameter> createRepeated() => $pb.PbList<Parameter>();

  @$core.pragma('dart2js:noInline')
  static Parameter getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Parameter>(create);
  static Parameter _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);

  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);

  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  Type get type => $_getN(1);

  @$pb.TagNumber(2)
  set type(Type v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);

  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(2)
  Type ensureType() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<$core.int> get defaultValue => $_getN(2);

  @$pb.TagNumber(3)
  set defaultValue($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDefaultValue() => $_has(2);

  @$pb.TagNumber(3)
  void clearDefaultValue() => clearField(3);
}

class Class extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Class',
      package: const $pb.PackageName('krpc.schema'),
      createEmptyInstance: create)
    ..aOS(1, 'name')
    ..aOS(2, 'documentation')
    ..hasRequiredFields = false;

  Class._() : super();

  factory Class() => create();

  factory Class.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory Class.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  Class clone() => Class()..mergeFromMessage(this);

  Class copyWith(void Function(Class) updates) =>
      super.copyWith((message) => updates(message as Class));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Class create() => Class._();

  Class createEmptyInstance() => create();

  static $pb.PbList<Class> createRepeated() => $pb.PbList<Class>();

  @$core.pragma('dart2js:noInline')
  static Class getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Class>(create);
  static Class _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);

  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);

  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get documentation => $_getSZ(1);

  @$pb.TagNumber(2)
  set documentation($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDocumentation() => $_has(1);

  @$pb.TagNumber(2)
  void clearDocumentation() => clearField(2);
}

class Enumeration extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Enumeration',
      package: const $pb.PackageName('krpc.schema'),
      createEmptyInstance: create)
    ..aOS(1, 'name')
    ..pc<EnumerationValue>(2, 'values', $pb.PbFieldType.PM,
        subBuilder: EnumerationValue.create)
    ..aOS(3, 'documentation')
    ..hasRequiredFields = false;

  Enumeration._() : super();

  factory Enumeration() => create();

  factory Enumeration.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory Enumeration.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  Enumeration clone() => Enumeration()..mergeFromMessage(this);

  Enumeration copyWith(void Function(Enumeration) updates) =>
      super.copyWith((message) => updates(message as Enumeration));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Enumeration create() => Enumeration._();

  Enumeration createEmptyInstance() => create();

  static $pb.PbList<Enumeration> createRepeated() => $pb.PbList<Enumeration>();

  @$core.pragma('dart2js:noInline')
  static Enumeration getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Enumeration>(create);
  static Enumeration _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);

  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);

  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<EnumerationValue> get values => $_getList(1);

  @$pb.TagNumber(3)
  $core.String get documentation => $_getSZ(2);

  @$pb.TagNumber(3)
  set documentation($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDocumentation() => $_has(2);

  @$pb.TagNumber(3)
  void clearDocumentation() => clearField(3);
}

class EnumerationValue extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('EnumerationValue',
      package: const $pb.PackageName('krpc.schema'),
      createEmptyInstance: create)
    ..aOS(1, 'name')
    ..a<$core.int>(2, 'value', $pb.PbFieldType.O3)
    ..aOS(3, 'documentation')
    ..hasRequiredFields = false;

  EnumerationValue._() : super();

  factory EnumerationValue() => create();

  factory EnumerationValue.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory EnumerationValue.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  EnumerationValue clone() => EnumerationValue()..mergeFromMessage(this);

  EnumerationValue copyWith(void Function(EnumerationValue) updates) =>
      super.copyWith((message) => updates(message as EnumerationValue));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EnumerationValue create() => EnumerationValue._();

  EnumerationValue createEmptyInstance() => create();

  static $pb.PbList<EnumerationValue> createRepeated() =>
      $pb.PbList<EnumerationValue>();

  @$core.pragma('dart2js:noInline')
  static EnumerationValue getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EnumerationValue>(create);
  static EnumerationValue _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);

  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);

  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get value => $_getIZ(1);

  @$pb.TagNumber(2)
  set value($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);

  @$pb.TagNumber(2)
  void clearValue() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get documentation => $_getSZ(2);

  @$pb.TagNumber(3)
  set documentation($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDocumentation() => $_has(2);

  @$pb.TagNumber(3)
  void clearDocumentation() => clearField(3);
}

class Exception extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Exception',
      package: const $pb.PackageName('krpc.schema'),
      createEmptyInstance: create)
    ..aOS(1, 'name')
    ..aOS(2, 'documentation')
    ..hasRequiredFields = false;

  Exception._() : super();

  factory Exception() => create();

  factory Exception.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory Exception.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  Exception clone() => Exception()..mergeFromMessage(this);

  Exception copyWith(void Function(Exception) updates) =>
      super.copyWith((message) => updates(message as Exception));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Exception create() => Exception._();

  Exception createEmptyInstance() => create();

  static $pb.PbList<Exception> createRepeated() => $pb.PbList<Exception>();

  @$core.pragma('dart2js:noInline')
  static Exception getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Exception>(create);
  static Exception _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);

  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);

  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get documentation => $_getSZ(1);

  @$pb.TagNumber(2)
  set documentation($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDocumentation() => $_has(1);

  @$pb.TagNumber(2)
  void clearDocumentation() => clearField(2);
}

class Type extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Type',
      package: const $pb.PackageName('krpc.schema'),
      createEmptyInstance: create)
    ..e<Type_TypeCode>(1, 'code', $pb.PbFieldType.OE,
        defaultOrMaker: Type_TypeCode.NONE,
        valueOf: Type_TypeCode.valueOf,
        enumValues: Type_TypeCode.values)
    ..aOS(2, 'service')
    ..aOS(3, 'name')
    ..pc<Type>(4, 'types', $pb.PbFieldType.PM, subBuilder: Type.create)
    ..hasRequiredFields = false;

  Type._() : super();

  factory Type() => create();

  factory Type.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory Type.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  Type clone() => Type()..mergeFromMessage(this);

  Type copyWith(void Function(Type) updates) =>
      super.copyWith((message) => updates(message as Type));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Type create() => Type._();

  Type createEmptyInstance() => create();

  static $pb.PbList<Type> createRepeated() => $pb.PbList<Type>();

  @$core.pragma('dart2js:noInline')
  static Type getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Type>(create);
  static Type _defaultInstance;

  @$pb.TagNumber(1)
  Type_TypeCode get code => $_getN(0);

  @$pb.TagNumber(1)
  set code(Type_TypeCode v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);

  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get service => $_getSZ(1);

  @$pb.TagNumber(2)
  set service($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasService() => $_has(1);

  @$pb.TagNumber(2)
  void clearService() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);

  @$pb.TagNumber(3)
  set name($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);

  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<Type> get types => $_getList(3);
}

class Tuple extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Tuple',
      package: const $pb.PackageName('krpc.schema'),
      createEmptyInstance: create)
    ..p<$core.List<$core.int>>(1, 'items', $pb.PbFieldType.PY)
    ..hasRequiredFields = false;

  Tuple._() : super();

  factory Tuple() => create();

  factory Tuple.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory Tuple.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  Tuple clone() => Tuple()..mergeFromMessage(this);

  Tuple copyWith(void Function(Tuple) updates) =>
      super.copyWith((message) => updates(message as Tuple));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Tuple create() => Tuple._();

  Tuple createEmptyInstance() => create();

  static $pb.PbList<Tuple> createRepeated() => $pb.PbList<Tuple>();

  @$core.pragma('dart2js:noInline')
  static Tuple getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Tuple>(create);
  static Tuple _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.List<$core.int>> get items => $_getList(0);
}

class List_ extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('List',
      package: const $pb.PackageName('krpc.schema'),
      createEmptyInstance: create)
    ..p<$core.List<$core.int>>(1, 'items', $pb.PbFieldType.PY)
    ..hasRequiredFields = false;

  List_._() : super();

  factory List_() => create();

  factory List_.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory List_.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  List_ clone() => List_()..mergeFromMessage(this);

  List_ copyWith(void Function(List_) updates) =>
      super.copyWith((message) => updates(message as List_));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static List_ create() => List_._();

  List_ createEmptyInstance() => create();

  static $pb.PbList<List_> createRepeated() => $pb.PbList<List_>();

  @$core.pragma('dart2js:noInline')
  static List_ getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<List_>(create);
  static List_ _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.List<$core.int>> get items => $_getList(0);
}

class Set extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Set',
      package: const $pb.PackageName('krpc.schema'),
      createEmptyInstance: create)
    ..p<$core.List<$core.int>>(1, 'items', $pb.PbFieldType.PY)
    ..hasRequiredFields = false;

  Set._() : super();

  factory Set() => create();

  factory Set.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory Set.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  Set clone() => Set()..mergeFromMessage(this);

  Set copyWith(void Function(Set) updates) =>
      super.copyWith((message) => updates(message as Set));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Set create() => Set._();

  Set createEmptyInstance() => create();

  static $pb.PbList<Set> createRepeated() => $pb.PbList<Set>();

  @$core.pragma('dart2js:noInline')
  static Set getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Set>(create);
  static Set _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.List<$core.int>> get items => $_getList(0);
}

class Dictionary extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Dictionary',
      package: const $pb.PackageName('krpc.schema'),
      createEmptyInstance: create)
    ..pc<DictionaryEntry>(1, 'entries', $pb.PbFieldType.PM,
        subBuilder: DictionaryEntry.create)
    ..hasRequiredFields = false;

  Dictionary._() : super();

  factory Dictionary() => create();

  factory Dictionary.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory Dictionary.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  Dictionary clone() => Dictionary()..mergeFromMessage(this);

  Dictionary copyWith(void Function(Dictionary) updates) =>
      super.copyWith((message) => updates(message as Dictionary));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Dictionary create() => Dictionary._();

  Dictionary createEmptyInstance() => create();

  static $pb.PbList<Dictionary> createRepeated() => $pb.PbList<Dictionary>();

  @$core.pragma('dart2js:noInline')
  static Dictionary getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Dictionary>(create);
  static Dictionary _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<DictionaryEntry> get entries => $_getList(0);
}

class DictionaryEntry extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DictionaryEntry',
      package: const $pb.PackageName('krpc.schema'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'key', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  DictionaryEntry._() : super();

  factory DictionaryEntry() => create();

  factory DictionaryEntry.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory DictionaryEntry.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  DictionaryEntry clone() => DictionaryEntry()..mergeFromMessage(this);

  DictionaryEntry copyWith(void Function(DictionaryEntry) updates) =>
      super.copyWith((message) => updates(message as DictionaryEntry));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DictionaryEntry create() => DictionaryEntry._();

  DictionaryEntry createEmptyInstance() => create();

  static $pb.PbList<DictionaryEntry> createRepeated() =>
      $pb.PbList<DictionaryEntry>();

  @$core.pragma('dart2js:noInline')
  static DictionaryEntry getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DictionaryEntry>(create);
  static DictionaryEntry _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get key => $_getN(0);

  @$pb.TagNumber(1)
  set key($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);

  @$pb.TagNumber(1)
  void clearKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get value => $_getN(1);

  @$pb.TagNumber(2)
  set value($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);

  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
}

class Stream extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Stream',
      package: const $pb.PackageName('krpc.schema'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  Stream._() : super();

  factory Stream() => create();

  factory Stream.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory Stream.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  Stream clone() => Stream()..mergeFromMessage(this);

  Stream copyWith(void Function(Stream) updates) =>
      super.copyWith((message) => updates(message as Stream));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Stream create() => Stream._();

  Stream createEmptyInstance() => create();

  static $pb.PbList<Stream> createRepeated() => $pb.PbList<Stream>();

  @$core.pragma('dart2js:noInline')
  static Stream getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Stream>(create);
  static Stream _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);

  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);

  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class Event extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Event',
      package: const $pb.PackageName('krpc.schema'),
      createEmptyInstance: create)
    ..aOM<Stream>(1, 'stream', subBuilder: Stream.create)
    ..hasRequiredFields = false;

  Event._() : super();

  factory Event() => create();

  factory Event.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory Event.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  Event clone() => Event()..mergeFromMessage(this);

  Event copyWith(void Function(Event) updates) =>
      super.copyWith((message) => updates(message as Event));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Event create() => Event._();

  Event createEmptyInstance() => create();

  static $pb.PbList<Event> createRepeated() => $pb.PbList<Event>();

  @$core.pragma('dart2js:noInline')
  static Event getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Event>(create);
  static Event _defaultInstance;

  @$pb.TagNumber(1)
  Stream get stream => $_getN(0);

  @$pb.TagNumber(1)
  set stream(Stream v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStream() => $_has(0);

  @$pb.TagNumber(1)
  void clearStream() => clearField(1);

  @$pb.TagNumber(1)
  Stream ensureStream() => $_ensure(0);
}

class Status extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Status',
      package: const $pb.PackageName('krpc.schema'),
      createEmptyInstance: create)
    ..aOS(1, 'version')
    ..a<$fixnum.Int64>(2, 'bytesRead', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, 'bytesWritten', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.double>(4, 'bytesReadRate', $pb.PbFieldType.OF)
    ..a<$core.double>(5, 'bytesWrittenRate', $pb.PbFieldType.OF)
    ..a<$fixnum.Int64>(6, 'rpcsExecuted', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.double>(7, 'rpcRate', $pb.PbFieldType.OF)
    ..aOB(8, 'oneRpcPerUpdate')
    ..a<$core.int>(9, 'maxTimePerUpdate', $pb.PbFieldType.OU3)
    ..aOB(10, 'adaptiveRateControl')
    ..aOB(11, 'blockingRecv')
    ..a<$core.int>(12, 'recvTimeout', $pb.PbFieldType.OU3)
    ..a<$core.double>(13, 'timePerRpcUpdate', $pb.PbFieldType.OF)
    ..a<$core.double>(14, 'pollTimePerRpcUpdate', $pb.PbFieldType.OF)
    ..a<$core.double>(15, 'execTimePerRpcUpdate', $pb.PbFieldType.OF)
    ..a<$core.int>(16, 'streamRpcs', $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(17, 'streamRpcsExecuted', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.double>(18, 'streamRpcRate', $pb.PbFieldType.OF)
    ..a<$core.double>(19, 'timePerStreamUpdate', $pb.PbFieldType.OF)
    ..hasRequiredFields = false;

  Status._() : super();

  factory Status() => create();

  factory Status.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory Status.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  Status clone() => Status()..mergeFromMessage(this);

  Status copyWith(void Function(Status) updates) =>
      super.copyWith((message) => updates(message as Status));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Status create() => Status._();

  Status createEmptyInstance() => create();

  static $pb.PbList<Status> createRepeated() => $pb.PbList<Status>();

  @$core.pragma('dart2js:noInline')
  static Status getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Status>(create);
  static Status _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get version => $_getSZ(0);

  @$pb.TagNumber(1)
  set version($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);

  @$pb.TagNumber(1)
  void clearVersion() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get bytesRead => $_getI64(1);

  @$pb.TagNumber(2)
  set bytesRead($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasBytesRead() => $_has(1);

  @$pb.TagNumber(2)
  void clearBytesRead() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get bytesWritten => $_getI64(2);

  @$pb.TagNumber(3)
  set bytesWritten($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasBytesWritten() => $_has(2);

  @$pb.TagNumber(3)
  void clearBytesWritten() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get bytesReadRate => $_getN(3);

  @$pb.TagNumber(4)
  set bytesReadRate($core.double v) {
    $_setFloat(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasBytesReadRate() => $_has(3);

  @$pb.TagNumber(4)
  void clearBytesReadRate() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get bytesWrittenRate => $_getN(4);

  @$pb.TagNumber(5)
  set bytesWrittenRate($core.double v) {
    $_setFloat(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasBytesWrittenRate() => $_has(4);

  @$pb.TagNumber(5)
  void clearBytesWrittenRate() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get rpcsExecuted => $_getI64(5);

  @$pb.TagNumber(6)
  set rpcsExecuted($fixnum.Int64 v) {
    $_setInt64(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasRpcsExecuted() => $_has(5);

  @$pb.TagNumber(6)
  void clearRpcsExecuted() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get rpcRate => $_getN(6);

  @$pb.TagNumber(7)
  set rpcRate($core.double v) {
    $_setFloat(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasRpcRate() => $_has(6);

  @$pb.TagNumber(7)
  void clearRpcRate() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get oneRpcPerUpdate => $_getBF(7);

  @$pb.TagNumber(8)
  set oneRpcPerUpdate($core.bool v) {
    $_setBool(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasOneRpcPerUpdate() => $_has(7);

  @$pb.TagNumber(8)
  void clearOneRpcPerUpdate() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get maxTimePerUpdate => $_getIZ(8);

  @$pb.TagNumber(9)
  set maxTimePerUpdate($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasMaxTimePerUpdate() => $_has(8);

  @$pb.TagNumber(9)
  void clearMaxTimePerUpdate() => clearField(9);

  @$pb.TagNumber(10)
  $core.bool get adaptiveRateControl => $_getBF(9);

  @$pb.TagNumber(10)
  set adaptiveRateControl($core.bool v) {
    $_setBool(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasAdaptiveRateControl() => $_has(9);

  @$pb.TagNumber(10)
  void clearAdaptiveRateControl() => clearField(10);

  @$pb.TagNumber(11)
  $core.bool get blockingRecv => $_getBF(10);

  @$pb.TagNumber(11)
  set blockingRecv($core.bool v) {
    $_setBool(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasBlockingRecv() => $_has(10);

  @$pb.TagNumber(11)
  void clearBlockingRecv() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get recvTimeout => $_getIZ(11);

  @$pb.TagNumber(12)
  set recvTimeout($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasRecvTimeout() => $_has(11);

  @$pb.TagNumber(12)
  void clearRecvTimeout() => clearField(12);

  @$pb.TagNumber(13)
  $core.double get timePerRpcUpdate => $_getN(12);

  @$pb.TagNumber(13)
  set timePerRpcUpdate($core.double v) {
    $_setFloat(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasTimePerRpcUpdate() => $_has(12);

  @$pb.TagNumber(13)
  void clearTimePerRpcUpdate() => clearField(13);

  @$pb.TagNumber(14)
  $core.double get pollTimePerRpcUpdate => $_getN(13);

  @$pb.TagNumber(14)
  set pollTimePerRpcUpdate($core.double v) {
    $_setFloat(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasPollTimePerRpcUpdate() => $_has(13);

  @$pb.TagNumber(14)
  void clearPollTimePerRpcUpdate() => clearField(14);

  @$pb.TagNumber(15)
  $core.double get execTimePerRpcUpdate => $_getN(14);

  @$pb.TagNumber(15)
  set execTimePerRpcUpdate($core.double v) {
    $_setFloat(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasExecTimePerRpcUpdate() => $_has(14);

  @$pb.TagNumber(15)
  void clearExecTimePerRpcUpdate() => clearField(15);

  @$pb.TagNumber(16)
  $core.int get streamRpcs => $_getIZ(15);

  @$pb.TagNumber(16)
  set streamRpcs($core.int v) {
    $_setUnsignedInt32(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasStreamRpcs() => $_has(15);

  @$pb.TagNumber(16)
  void clearStreamRpcs() => clearField(16);

  @$pb.TagNumber(17)
  $fixnum.Int64 get streamRpcsExecuted => $_getI64(16);

  @$pb.TagNumber(17)
  set streamRpcsExecuted($fixnum.Int64 v) {
    $_setInt64(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasStreamRpcsExecuted() => $_has(16);

  @$pb.TagNumber(17)
  void clearStreamRpcsExecuted() => clearField(17);

  @$pb.TagNumber(18)
  $core.double get streamRpcRate => $_getN(17);

  @$pb.TagNumber(18)
  set streamRpcRate($core.double v) {
    $_setFloat(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasStreamRpcRate() => $_has(17);

  @$pb.TagNumber(18)
  void clearStreamRpcRate() => clearField(18);

  @$pb.TagNumber(19)
  $core.double get timePerStreamUpdate => $_getN(18);

  @$pb.TagNumber(19)
  set timePerStreamUpdate($core.double v) {
    $_setFloat(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasTimePerStreamUpdate() => $_has(18);

  @$pb.TagNumber(19)
  void clearTimePerStreamUpdate() => clearField(19);
}

class MultiplexedRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('MultiplexedRequest',
      package: const $pb.PackageName('krpc.schema'),
      createEmptyInstance: create)
    ..aOM<ConnectionRequest>(1, 'connectionRequest',
        subBuilder: ConnectionRequest.create)
    ..aOM<Request>(2, 'request', subBuilder: Request.create)
    ..hasRequiredFields = false;

  MultiplexedRequest._() : super();

  factory MultiplexedRequest() => create();

  factory MultiplexedRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory MultiplexedRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  MultiplexedRequest clone() => MultiplexedRequest()..mergeFromMessage(this);

  MultiplexedRequest copyWith(void Function(MultiplexedRequest) updates) =>
      super.copyWith((message) => updates(message as MultiplexedRequest));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MultiplexedRequest create() => MultiplexedRequest._();

  MultiplexedRequest createEmptyInstance() => create();

  static $pb.PbList<MultiplexedRequest> createRepeated() =>
      $pb.PbList<MultiplexedRequest>();

  @$core.pragma('dart2js:noInline')
  static MultiplexedRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MultiplexedRequest>(create);
  static MultiplexedRequest _defaultInstance;

  @$pb.TagNumber(1)
  ConnectionRequest get connectionRequest => $_getN(0);

  @$pb.TagNumber(1)
  set connectionRequest(ConnectionRequest v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasConnectionRequest() => $_has(0);

  @$pb.TagNumber(1)
  void clearConnectionRequest() => clearField(1);

  @$pb.TagNumber(1)
  ConnectionRequest ensureConnectionRequest() => $_ensure(0);

  @$pb.TagNumber(2)
  Request get request => $_getN(1);

  @$pb.TagNumber(2)
  set request(Request v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRequest() => $_has(1);

  @$pb.TagNumber(2)
  void clearRequest() => clearField(2);

  @$pb.TagNumber(2)
  Request ensureRequest() => $_ensure(1);
}

class MultiplexedResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('MultiplexedResponse',
      package: const $pb.PackageName('krpc.schema'),
      createEmptyInstance: create)
    ..aOM<Response>(1, 'response', subBuilder: Response.create)
    ..aOM<StreamUpdate>(2, 'streamUpdate', subBuilder: StreamUpdate.create)
    ..hasRequiredFields = false;

  MultiplexedResponse._() : super();

  factory MultiplexedResponse() => create();

  factory MultiplexedResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory MultiplexedResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  MultiplexedResponse clone() => MultiplexedResponse()..mergeFromMessage(this);

  MultiplexedResponse copyWith(void Function(MultiplexedResponse) updates) =>
      super.copyWith((message) => updates(message as MultiplexedResponse));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MultiplexedResponse create() => MultiplexedResponse._();

  MultiplexedResponse createEmptyInstance() => create();

  static $pb.PbList<MultiplexedResponse> createRepeated() =>
      $pb.PbList<MultiplexedResponse>();

  @$core.pragma('dart2js:noInline')
  static MultiplexedResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MultiplexedResponse>(create);
  static MultiplexedResponse _defaultInstance;

  @$pb.TagNumber(1)
  Response get response => $_getN(0);

  @$pb.TagNumber(1)
  set response(Response v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasResponse() => $_has(0);

  @$pb.TagNumber(1)
  void clearResponse() => clearField(1);

  @$pb.TagNumber(1)
  Response ensureResponse() => $_ensure(0);

  @$pb.TagNumber(2)
  StreamUpdate get streamUpdate => $_getN(1);

  @$pb.TagNumber(2)
  set streamUpdate(StreamUpdate v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasStreamUpdate() => $_has(1);

  @$pb.TagNumber(2)
  void clearStreamUpdate() => clearField(2);

  @$pb.TagNumber(2)
  StreamUpdate ensureStreamUpdate() => $_ensure(1);
}
