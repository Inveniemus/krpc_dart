///
//  Generated code. Do not modify.
//  source: krpc.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use connectionRequestDescriptor instead')
const ConnectionRequest$json = const {
  '1': 'ConnectionRequest',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.krpc.schema.ConnectionRequest.Type', '10': 'type'},
    const {'1': 'client_name', '3': 2, '4': 1, '5': 9, '10': 'clientName'},
    const {'1': 'client_identifier', '3': 3, '4': 1, '5': 12, '10': 'clientIdentifier'},
  ],
  '4': const [ConnectionRequest_Type$json],
};

@$core.Deprecated('Use connectionRequestDescriptor instead')
const ConnectionRequest_Type$json = const {
  '1': 'Type',
  '2': const [
    const {'1': 'RPC', '2': 0},
    const {'1': 'STREAM', '2': 1},
  ],
};

/// Descriptor for `ConnectionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List connectionRequestDescriptor = $convert.base64Decode('ChFDb25uZWN0aW9uUmVxdWVzdBI3CgR0eXBlGAEgASgOMiMua3JwYy5zY2hlbWEuQ29ubmVjdGlvblJlcXVlc3QuVHlwZVIEdHlwZRIfCgtjbGllbnRfbmFtZRgCIAEoCVIKY2xpZW50TmFtZRIrChFjbGllbnRfaWRlbnRpZmllchgDIAEoDFIQY2xpZW50SWRlbnRpZmllciIbCgRUeXBlEgcKA1JQQxAAEgoKBlNUUkVBTRAB');
@$core.Deprecated('Use connectionResponseDescriptor instead')
const ConnectionResponse$json = const {
  '1': 'ConnectionResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.krpc.schema.ConnectionResponse.Status', '10': 'status'},
    const {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'client_identifier', '3': 3, '4': 1, '5': 12, '10': 'clientIdentifier'},
  ],
  '4': const [ConnectionResponse_Status$json],
};

@$core.Deprecated('Use connectionResponseDescriptor instead')
const ConnectionResponse_Status$json = const {
  '1': 'Status',
  '2': const [
    const {'1': 'OK', '2': 0},
    const {'1': 'MALFORMED_MESSAGE', '2': 1},
    const {'1': 'TIMEOUT', '2': 2},
    const {'1': 'WRONG_TYPE', '2': 3},
  ],
};

/// Descriptor for `ConnectionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List connectionResponseDescriptor = $convert.base64Decode('ChJDb25uZWN0aW9uUmVzcG9uc2USPgoGc3RhdHVzGAEgASgOMiYua3JwYy5zY2hlbWEuQ29ubmVjdGlvblJlc3BvbnNlLlN0YXR1c1IGc3RhdHVzEhgKB21lc3NhZ2UYAiABKAlSB21lc3NhZ2USKwoRY2xpZW50X2lkZW50aWZpZXIYAyABKAxSEGNsaWVudElkZW50aWZpZXIiRAoGU3RhdHVzEgYKAk9LEAASFQoRTUFMRk9STUVEX01FU1NBR0UQARILCgdUSU1FT1VUEAISDgoKV1JPTkdfVFlQRRAD');
@$core.Deprecated('Use requestDescriptor instead')
const Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'calls', '3': 1, '4': 3, '5': 11, '6': '.krpc.schema.ProcedureCall', '10': 'calls'},
  ],
};

/// Descriptor for `Request`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestDescriptor = $convert.base64Decode('CgdSZXF1ZXN0EjAKBWNhbGxzGAEgAygLMhoua3JwYy5zY2hlbWEuUHJvY2VkdXJlQ2FsbFIFY2FsbHM=');
@$core.Deprecated('Use procedureCallDescriptor instead')
const ProcedureCall$json = const {
  '1': 'ProcedureCall',
  '2': const [
    const {'1': 'service', '3': 1, '4': 1, '5': 9, '10': 'service'},
    const {'1': 'procedure', '3': 2, '4': 1, '5': 9, '10': 'procedure'},
    const {'1': 'service_id', '3': 4, '4': 1, '5': 13, '10': 'serviceId'},
    const {'1': 'procedure_id', '3': 5, '4': 1, '5': 13, '10': 'procedureId'},
    const {'1': 'arguments', '3': 3, '4': 3, '5': 11, '6': '.krpc.schema.Argument', '10': 'arguments'},
  ],
};

/// Descriptor for `ProcedureCall`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List procedureCallDescriptor = $convert.base64Decode('Cg1Qcm9jZWR1cmVDYWxsEhgKB3NlcnZpY2UYASABKAlSB3NlcnZpY2USHAoJcHJvY2VkdXJlGAIgASgJUglwcm9jZWR1cmUSHQoKc2VydmljZV9pZBgEIAEoDVIJc2VydmljZUlkEiEKDHByb2NlZHVyZV9pZBgFIAEoDVILcHJvY2VkdXJlSWQSMwoJYXJndW1lbnRzGAMgAygLMhUua3JwYy5zY2hlbWEuQXJndW1lbnRSCWFyZ3VtZW50cw==');
@$core.Deprecated('Use argumentDescriptor instead')
const Argument$json = const {
  '1': 'Argument',
  '2': const [
    const {'1': 'position', '3': 1, '4': 1, '5': 13, '10': 'position'},
    const {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
};

/// Descriptor for `Argument`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List argumentDescriptor = $convert.base64Decode('CghBcmd1bWVudBIaCghwb3NpdGlvbhgBIAEoDVIIcG9zaXRpb24SFAoFdmFsdWUYAiABKAxSBXZhbHVl');
@$core.Deprecated('Use responseDescriptor instead')
const Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'error', '3': 1, '4': 1, '5': 11, '6': '.krpc.schema.Error', '10': 'error'},
    const {'1': 'results', '3': 2, '4': 3, '5': 11, '6': '.krpc.schema.ProcedureResult', '10': 'results'},
  ],
};

/// Descriptor for `Response`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List responseDescriptor = $convert.base64Decode('CghSZXNwb25zZRIoCgVlcnJvchgBIAEoCzISLmtycGMuc2NoZW1hLkVycm9yUgVlcnJvchI2CgdyZXN1bHRzGAIgAygLMhwua3JwYy5zY2hlbWEuUHJvY2VkdXJlUmVzdWx0UgdyZXN1bHRz');
@$core.Deprecated('Use procedureResultDescriptor instead')
const ProcedureResult$json = const {
  '1': 'ProcedureResult',
  '2': const [
    const {'1': 'error', '3': 1, '4': 1, '5': 11, '6': '.krpc.schema.Error', '10': 'error'},
    const {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
};

/// Descriptor for `ProcedureResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List procedureResultDescriptor = $convert.base64Decode('Cg9Qcm9jZWR1cmVSZXN1bHQSKAoFZXJyb3IYASABKAsyEi5rcnBjLnNjaGVtYS5FcnJvclIFZXJyb3ISFAoFdmFsdWUYAiABKAxSBXZhbHVl');
@$core.Deprecated('Use errorDescriptor instead')
const Error$json = const {
  '1': 'Error',
  '2': const [
    const {'1': 'service', '3': 1, '4': 1, '5': 9, '10': 'service'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'stack_trace', '3': 4, '4': 1, '5': 9, '10': 'stackTrace'},
  ],
};

/// Descriptor for `Error`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List errorDescriptor = $convert.base64Decode('CgVFcnJvchIYCgdzZXJ2aWNlGAEgASgJUgdzZXJ2aWNlEhIKBG5hbWUYAiABKAlSBG5hbWUSIAoLZGVzY3JpcHRpb24YAyABKAlSC2Rlc2NyaXB0aW9uEh8KC3N0YWNrX3RyYWNlGAQgASgJUgpzdGFja1RyYWNl');
@$core.Deprecated('Use streamUpdateDescriptor instead')
const StreamUpdate$json = const {
  '1': 'StreamUpdate',
  '2': const [
    const {'1': 'results', '3': 1, '4': 3, '5': 11, '6': '.krpc.schema.StreamResult', '10': 'results'},
  ],
};

/// Descriptor for `StreamUpdate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamUpdateDescriptor = $convert.base64Decode('CgxTdHJlYW1VcGRhdGUSMwoHcmVzdWx0cxgBIAMoCzIZLmtycGMuc2NoZW1hLlN0cmVhbVJlc3VsdFIHcmVzdWx0cw==');
@$core.Deprecated('Use streamResultDescriptor instead')
const StreamResult$json = const {
  '1': 'StreamResult',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 4, '10': 'id'},
    const {'1': 'result', '3': 2, '4': 1, '5': 11, '6': '.krpc.schema.ProcedureResult', '10': 'result'},
  ],
};

/// Descriptor for `StreamResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamResultDescriptor = $convert.base64Decode('CgxTdHJlYW1SZXN1bHQSDgoCaWQYASABKARSAmlkEjQKBnJlc3VsdBgCIAEoCzIcLmtycGMuc2NoZW1hLlByb2NlZHVyZVJlc3VsdFIGcmVzdWx0');
@$core.Deprecated('Use servicesDescriptor instead')
const Services$json = const {
  '1': 'Services',
  '2': const [
    const {'1': 'services', '3': 1, '4': 3, '5': 11, '6': '.krpc.schema.Service', '10': 'services'},
  ],
};

/// Descriptor for `Services`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List servicesDescriptor = $convert.base64Decode('CghTZXJ2aWNlcxIwCghzZXJ2aWNlcxgBIAMoCzIULmtycGMuc2NoZW1hLlNlcnZpY2VSCHNlcnZpY2Vz');
@$core.Deprecated('Use serviceDescriptor instead')
const Service$json = const {
  '1': 'Service',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'procedures', '3': 2, '4': 3, '5': 11, '6': '.krpc.schema.Procedure', '10': 'procedures'},
    const {'1': 'classes', '3': 3, '4': 3, '5': 11, '6': '.krpc.schema.Class', '10': 'classes'},
    const {'1': 'enumerations', '3': 4, '4': 3, '5': 11, '6': '.krpc.schema.Enumeration', '10': 'enumerations'},
    const {'1': 'exceptions', '3': 5, '4': 3, '5': 11, '6': '.krpc.schema.Exception', '10': 'exceptions'},
    const {'1': 'documentation', '3': 6, '4': 1, '5': 9, '10': 'documentation'},
  ],
};

/// Descriptor for `Service`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serviceDescriptor = $convert.base64Decode('CgdTZXJ2aWNlEhIKBG5hbWUYASABKAlSBG5hbWUSNgoKcHJvY2VkdXJlcxgCIAMoCzIWLmtycGMuc2NoZW1hLlByb2NlZHVyZVIKcHJvY2VkdXJlcxIsCgdjbGFzc2VzGAMgAygLMhIua3JwYy5zY2hlbWEuQ2xhc3NSB2NsYXNzZXMSPAoMZW51bWVyYXRpb25zGAQgAygLMhgua3JwYy5zY2hlbWEuRW51bWVyYXRpb25SDGVudW1lcmF0aW9ucxI2CgpleGNlcHRpb25zGAUgAygLMhYua3JwYy5zY2hlbWEuRXhjZXB0aW9uUgpleGNlcHRpb25zEiQKDWRvY3VtZW50YXRpb24YBiABKAlSDWRvY3VtZW50YXRpb24=');
@$core.Deprecated('Use procedureDescriptor instead')
const Procedure$json = const {
  '1': 'Procedure',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'parameters', '3': 2, '4': 3, '5': 11, '6': '.krpc.schema.Parameter', '10': 'parameters'},
    const {'1': 'return_type', '3': 3, '4': 1, '5': 11, '6': '.krpc.schema.Type', '10': 'returnType'},
    const {'1': 'return_is_nullable', '3': 4, '4': 1, '5': 8, '10': 'returnIsNullable'},
    const {'1': 'game_scenes', '3': 6, '4': 3, '5': 14, '6': '.krpc.schema.Procedure.GameScene', '10': 'gameScenes'},
    const {'1': 'documentation', '3': 5, '4': 1, '5': 9, '10': 'documentation'},
  ],
  '4': const [Procedure_GameScene$json],
};

@$core.Deprecated('Use procedureDescriptor instead')
const Procedure_GameScene$json = const {
  '1': 'GameScene',
  '2': const [
    const {'1': 'SPACE_CENTER', '2': 0},
    const {'1': 'FLIGHT', '2': 1},
    const {'1': 'TRACKING_STATION', '2': 2},
    const {'1': 'EDITOR_VAB', '2': 3},
    const {'1': 'EDITOR_SPH', '2': 4},
    const {'1': 'MISSION_BUILDER', '2': 5},
  ],
};

/// Descriptor for `Procedure`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List procedureDescriptor = $convert.base64Decode('CglQcm9jZWR1cmUSEgoEbmFtZRgBIAEoCVIEbmFtZRI2CgpwYXJhbWV0ZXJzGAIgAygLMhYua3JwYy5zY2hlbWEuUGFyYW1ldGVyUgpwYXJhbWV0ZXJzEjIKC3JldHVybl90eXBlGAMgASgLMhEua3JwYy5zY2hlbWEuVHlwZVIKcmV0dXJuVHlwZRIsChJyZXR1cm5faXNfbnVsbGFibGUYBCABKAhSEHJldHVybklzTnVsbGFibGUSQQoLZ2FtZV9zY2VuZXMYBiADKA4yIC5rcnBjLnNjaGVtYS5Qcm9jZWR1cmUuR2FtZVNjZW5lUgpnYW1lU2NlbmVzEiQKDWRvY3VtZW50YXRpb24YBSABKAlSDWRvY3VtZW50YXRpb24idAoJR2FtZVNjZW5lEhAKDFNQQUNFX0NFTlRFUhAAEgoKBkZMSUdIVBABEhQKEFRSQUNLSU5HX1NUQVRJT04QAhIOCgpFRElUT1JfVkFCEAMSDgoKRURJVE9SX1NQSBAEEhMKD01JU1NJT05fQlVJTERFUhAF');
@$core.Deprecated('Use parameterDescriptor instead')
const Parameter$json = const {
  '1': 'Parameter',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'type', '3': 2, '4': 1, '5': 11, '6': '.krpc.schema.Type', '10': 'type'},
    const {'1': 'default_value', '3': 3, '4': 1, '5': 12, '10': 'defaultValue'},
  ],
};

/// Descriptor for `Parameter`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List parameterDescriptor = $convert.base64Decode('CglQYXJhbWV0ZXISEgoEbmFtZRgBIAEoCVIEbmFtZRIlCgR0eXBlGAIgASgLMhEua3JwYy5zY2hlbWEuVHlwZVIEdHlwZRIjCg1kZWZhdWx0X3ZhbHVlGAMgASgMUgxkZWZhdWx0VmFsdWU=');
@$core.Deprecated('Use classDescriptor instead')
const Class$json = const {
  '1': 'Class',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'documentation', '3': 2, '4': 1, '5': 9, '10': 'documentation'},
  ],
};

/// Descriptor for `Class`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List classDescriptor = $convert.base64Decode('CgVDbGFzcxISCgRuYW1lGAEgASgJUgRuYW1lEiQKDWRvY3VtZW50YXRpb24YAiABKAlSDWRvY3VtZW50YXRpb24=');
@$core.Deprecated('Use enumerationDescriptor instead')
const Enumeration$json = const {
  '1': 'Enumeration',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'values', '3': 2, '4': 3, '5': 11, '6': '.krpc.schema.EnumerationValue', '10': 'values'},
    const {'1': 'documentation', '3': 3, '4': 1, '5': 9, '10': 'documentation'},
  ],
};

/// Descriptor for `Enumeration`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List enumerationDescriptor = $convert.base64Decode('CgtFbnVtZXJhdGlvbhISCgRuYW1lGAEgASgJUgRuYW1lEjUKBnZhbHVlcxgCIAMoCzIdLmtycGMuc2NoZW1hLkVudW1lcmF0aW9uVmFsdWVSBnZhbHVlcxIkCg1kb2N1bWVudGF0aW9uGAMgASgJUg1kb2N1bWVudGF0aW9u');
@$core.Deprecated('Use enumerationValueDescriptor instead')
const EnumerationValue$json = const {
  '1': 'EnumerationValue',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'value', '3': 2, '4': 1, '5': 5, '10': 'value'},
    const {'1': 'documentation', '3': 3, '4': 1, '5': 9, '10': 'documentation'},
  ],
};

/// Descriptor for `EnumerationValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List enumerationValueDescriptor = $convert.base64Decode('ChBFbnVtZXJhdGlvblZhbHVlEhIKBG5hbWUYASABKAlSBG5hbWUSFAoFdmFsdWUYAiABKAVSBXZhbHVlEiQKDWRvY3VtZW50YXRpb24YAyABKAlSDWRvY3VtZW50YXRpb24=');
@$core.Deprecated('Use exceptionDescriptor instead')
const Exception$json = const {
  '1': 'Exception',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'documentation', '3': 2, '4': 1, '5': 9, '10': 'documentation'},
  ],
};

/// Descriptor for `Exception`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exceptionDescriptor = $convert.base64Decode('CglFeGNlcHRpb24SEgoEbmFtZRgBIAEoCVIEbmFtZRIkCg1kb2N1bWVudGF0aW9uGAIgASgJUg1kb2N1bWVudGF0aW9u');
@$core.Deprecated('Use typeDescriptor instead')
const Type$json = const {
  '1': 'Type',
  '2': const [
    const {'1': 'code', '3': 1, '4': 1, '5': 14, '6': '.krpc.schema.Type.TypeCode', '10': 'code'},
    const {'1': 'service', '3': 2, '4': 1, '5': 9, '10': 'service'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'types', '3': 4, '4': 3, '5': 11, '6': '.krpc.schema.Type', '10': 'types'},
  ],
  '4': const [Type_TypeCode$json],
};

@$core.Deprecated('Use typeDescriptor instead')
const Type_TypeCode$json = const {
  '1': 'TypeCode',
  '2': const [
    const {'1': 'NONE', '2': 0},
    const {'1': 'DOUBLE', '2': 1},
    const {'1': 'FLOAT', '2': 2},
    const {'1': 'SINT32', '2': 3},
    const {'1': 'SINT64', '2': 4},
    const {'1': 'UINT32', '2': 5},
    const {'1': 'UINT64', '2': 6},
    const {'1': 'BOOL', '2': 7},
    const {'1': 'STRING', '2': 8},
    const {'1': 'BYTES', '2': 9},
    const {'1': 'CLASS', '2': 100},
    const {'1': 'ENUMERATION', '2': 101},
    const {'1': 'EVENT', '2': 200},
    const {'1': 'PROCEDURE_CALL', '2': 201},
    const {'1': 'STREAM', '2': 202},
    const {'1': 'STATUS', '2': 203},
    const {'1': 'SERVICES', '2': 204},
    const {'1': 'TUPLE', '2': 300},
    const {'1': 'LIST', '2': 301},
    const {'1': 'SET', '2': 302},
    const {'1': 'DICTIONARY', '2': 303},
  ],
};

/// Descriptor for `Type`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List typeDescriptor = $convert.base64Decode('CgRUeXBlEi4KBGNvZGUYASABKA4yGi5rcnBjLnNjaGVtYS5UeXBlLlR5cGVDb2RlUgRjb2RlEhgKB3NlcnZpY2UYAiABKAlSB3NlcnZpY2USEgoEbmFtZRgDIAEoCVIEbmFtZRInCgV0eXBlcxgEIAMoCzIRLmtycGMuc2NoZW1hLlR5cGVSBXR5cGVzIpQCCghUeXBlQ29kZRIICgROT05FEAASCgoGRE9VQkxFEAESCQoFRkxPQVQQAhIKCgZTSU5UMzIQAxIKCgZTSU5UNjQQBBIKCgZVSU5UMzIQBRIKCgZVSU5UNjQQBhIICgRCT09MEAcSCgoGU1RSSU5HEAgSCQoFQllURVMQCRIJCgVDTEFTUxBkEg8KC0VOVU1FUkFUSU9OEGUSCgoFRVZFTlQQyAESEwoOUFJPQ0VEVVJFX0NBTEwQyQESCwoGU1RSRUFNEMoBEgsKBlNUQVRVUxDLARINCghTRVJWSUNFUxDMARIKCgVUVVBMRRCsAhIJCgRMSVNUEK0CEggKA1NFVBCuAhIPCgpESUNUSU9OQVJZEK8C');
@$core.Deprecated('Use tupleDescriptor instead')
const Tuple$json = const {
  '1': 'Tuple',
  '2': const [
    const {'1': 'items', '3': 1, '4': 3, '5': 12, '10': 'items'},
  ],
};

/// Descriptor for `Tuple`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tupleDescriptor = $convert.base64Decode('CgVUdXBsZRIUCgVpdGVtcxgBIAMoDFIFaXRlbXM=');
@$core.Deprecated('Use list_Descriptor instead')
const List_$json = const {
  '1': 'List',
  '2': const [
    const {'1': 'items', '3': 1, '4': 3, '5': 12, '10': 'items'},
  ],
};

/// Descriptor for `List`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List list_Descriptor = $convert.base64Decode('CgRMaXN0EhQKBWl0ZW1zGAEgAygMUgVpdGVtcw==');
@$core.Deprecated('Use setDescriptor instead')
const Set$json = const {
  '1': 'Set',
  '2': const [
    const {'1': 'items', '3': 1, '4': 3, '5': 12, '10': 'items'},
  ],
};

/// Descriptor for `Set`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setDescriptor = $convert.base64Decode('CgNTZXQSFAoFaXRlbXMYASADKAxSBWl0ZW1z');
@$core.Deprecated('Use dictionaryDescriptor instead')
const Dictionary$json = const {
  '1': 'Dictionary',
  '2': const [
    const {'1': 'entries', '3': 1, '4': 3, '5': 11, '6': '.krpc.schema.DictionaryEntry', '10': 'entries'},
  ],
};

/// Descriptor for `Dictionary`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dictionaryDescriptor = $convert.base64Decode('CgpEaWN0aW9uYXJ5EjYKB2VudHJpZXMYASADKAsyHC5rcnBjLnNjaGVtYS5EaWN0aW9uYXJ5RW50cnlSB2VudHJpZXM=');
@$core.Deprecated('Use dictionaryEntryDescriptor instead')
const DictionaryEntry$json = const {
  '1': 'DictionaryEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 12, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
};

/// Descriptor for `DictionaryEntry`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dictionaryEntryDescriptor = $convert.base64Decode('Cg9EaWN0aW9uYXJ5RW50cnkSEAoDa2V5GAEgASgMUgNrZXkSFAoFdmFsdWUYAiABKAxSBXZhbHVl');
@$core.Deprecated('Use streamDescriptor instead')
const Stream$json = const {
  '1': 'Stream',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 4, '10': 'id'},
  ],
};

/// Descriptor for `Stream`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamDescriptor = $convert.base64Decode('CgZTdHJlYW0SDgoCaWQYASABKARSAmlk');
@$core.Deprecated('Use eventDescriptor instead')
const Event$json = const {
  '1': 'Event',
  '2': const [
    const {'1': 'stream', '3': 1, '4': 1, '5': 11, '6': '.krpc.schema.Stream', '10': 'stream'},
  ],
};

/// Descriptor for `Event`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventDescriptor = $convert.base64Decode('CgVFdmVudBIrCgZzdHJlYW0YASABKAsyEy5rcnBjLnNjaGVtYS5TdHJlYW1SBnN0cmVhbQ==');
@$core.Deprecated('Use statusDescriptor instead')
const Status$json = const {
  '1': 'Status',
  '2': const [
    const {'1': 'version', '3': 1, '4': 1, '5': 9, '10': 'version'},
    const {'1': 'bytes_read', '3': 2, '4': 1, '5': 4, '10': 'bytesRead'},
    const {'1': 'bytes_written', '3': 3, '4': 1, '5': 4, '10': 'bytesWritten'},
    const {'1': 'bytes_read_rate', '3': 4, '4': 1, '5': 2, '10': 'bytesReadRate'},
    const {'1': 'bytes_written_rate', '3': 5, '4': 1, '5': 2, '10': 'bytesWrittenRate'},
    const {'1': 'rpcs_executed', '3': 6, '4': 1, '5': 4, '10': 'rpcsExecuted'},
    const {'1': 'rpc_rate', '3': 7, '4': 1, '5': 2, '10': 'rpcRate'},
    const {'1': 'one_rpc_per_update', '3': 8, '4': 1, '5': 8, '10': 'oneRpcPerUpdate'},
    const {'1': 'max_time_per_update', '3': 9, '4': 1, '5': 13, '10': 'maxTimePerUpdate'},
    const {'1': 'adaptive_rate_control', '3': 10, '4': 1, '5': 8, '10': 'adaptiveRateControl'},
    const {'1': 'blocking_recv', '3': 11, '4': 1, '5': 8, '10': 'blockingRecv'},
    const {'1': 'recv_timeout', '3': 12, '4': 1, '5': 13, '10': 'recvTimeout'},
    const {'1': 'time_per_rpc_update', '3': 13, '4': 1, '5': 2, '10': 'timePerRpcUpdate'},
    const {'1': 'poll_time_per_rpc_update', '3': 14, '4': 1, '5': 2, '10': 'pollTimePerRpcUpdate'},
    const {'1': 'exec_time_per_rpc_update', '3': 15, '4': 1, '5': 2, '10': 'execTimePerRpcUpdate'},
    const {'1': 'stream_rpcs', '3': 16, '4': 1, '5': 13, '10': 'streamRpcs'},
    const {'1': 'stream_rpcs_executed', '3': 17, '4': 1, '5': 4, '10': 'streamRpcsExecuted'},
    const {'1': 'stream_rpc_rate', '3': 18, '4': 1, '5': 2, '10': 'streamRpcRate'},
    const {'1': 'time_per_stream_update', '3': 19, '4': 1, '5': 2, '10': 'timePerStreamUpdate'},
  ],
};

/// Descriptor for `Status`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List statusDescriptor = $convert.base64Decode('CgZTdGF0dXMSGAoHdmVyc2lvbhgBIAEoCVIHdmVyc2lvbhIdCgpieXRlc19yZWFkGAIgASgEUglieXRlc1JlYWQSIwoNYnl0ZXNfd3JpdHRlbhgDIAEoBFIMYnl0ZXNXcml0dGVuEiYKD2J5dGVzX3JlYWRfcmF0ZRgEIAEoAlINYnl0ZXNSZWFkUmF0ZRIsChJieXRlc193cml0dGVuX3JhdGUYBSABKAJSEGJ5dGVzV3JpdHRlblJhdGUSIwoNcnBjc19leGVjdXRlZBgGIAEoBFIMcnBjc0V4ZWN1dGVkEhkKCHJwY19yYXRlGAcgASgCUgdycGNSYXRlEisKEm9uZV9ycGNfcGVyX3VwZGF0ZRgIIAEoCFIPb25lUnBjUGVyVXBkYXRlEi0KE21heF90aW1lX3Blcl91cGRhdGUYCSABKA1SEG1heFRpbWVQZXJVcGRhdGUSMgoVYWRhcHRpdmVfcmF0ZV9jb250cm9sGAogASgIUhNhZGFwdGl2ZVJhdGVDb250cm9sEiMKDWJsb2NraW5nX3JlY3YYCyABKAhSDGJsb2NraW5nUmVjdhIhCgxyZWN2X3RpbWVvdXQYDCABKA1SC3JlY3ZUaW1lb3V0Ei0KE3RpbWVfcGVyX3JwY191cGRhdGUYDSABKAJSEHRpbWVQZXJScGNVcGRhdGUSNgoYcG9sbF90aW1lX3Blcl9ycGNfdXBkYXRlGA4gASgCUhRwb2xsVGltZVBlclJwY1VwZGF0ZRI2ChhleGVjX3RpbWVfcGVyX3JwY191cGRhdGUYDyABKAJSFGV4ZWNUaW1lUGVyUnBjVXBkYXRlEh8KC3N0cmVhbV9ycGNzGBAgASgNUgpzdHJlYW1ScGNzEjAKFHN0cmVhbV9ycGNzX2V4ZWN1dGVkGBEgASgEUhJzdHJlYW1ScGNzRXhlY3V0ZWQSJgoPc3RyZWFtX3JwY19yYXRlGBIgASgCUg1zdHJlYW1ScGNSYXRlEjMKFnRpbWVfcGVyX3N0cmVhbV91cGRhdGUYEyABKAJSE3RpbWVQZXJTdHJlYW1VcGRhdGU=');
@$core.Deprecated('Use multiplexedRequestDescriptor instead')
const MultiplexedRequest$json = const {
  '1': 'MultiplexedRequest',
  '2': const [
    const {'1': 'connection_request', '3': 1, '4': 1, '5': 11, '6': '.krpc.schema.ConnectionRequest', '10': 'connectionRequest'},
    const {'1': 'request', '3': 2, '4': 1, '5': 11, '6': '.krpc.schema.Request', '10': 'request'},
  ],
};

/// Descriptor for `MultiplexedRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List multiplexedRequestDescriptor = $convert.base64Decode('ChJNdWx0aXBsZXhlZFJlcXVlc3QSTQoSY29ubmVjdGlvbl9yZXF1ZXN0GAEgASgLMh4ua3JwYy5zY2hlbWEuQ29ubmVjdGlvblJlcXVlc3RSEWNvbm5lY3Rpb25SZXF1ZXN0Ei4KB3JlcXVlc3QYAiABKAsyFC5rcnBjLnNjaGVtYS5SZXF1ZXN0UgdyZXF1ZXN0');
@$core.Deprecated('Use multiplexedResponseDescriptor instead')
const MultiplexedResponse$json = const {
  '1': 'MultiplexedResponse',
  '2': const [
    const {'1': 'response', '3': 1, '4': 1, '5': 11, '6': '.krpc.schema.Response', '10': 'response'},
    const {'1': 'stream_update', '3': 2, '4': 1, '5': 11, '6': '.krpc.schema.StreamUpdate', '10': 'streamUpdate'},
  ],
};

/// Descriptor for `MultiplexedResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List multiplexedResponseDescriptor = $convert.base64Decode('ChNNdWx0aXBsZXhlZFJlc3BvbnNlEjEKCHJlc3BvbnNlGAEgASgLMhUua3JwYy5zY2hlbWEuUmVzcG9uc2VSCHJlc3BvbnNlEj4KDXN0cmVhbV91cGRhdGUYAiABKAsyGS5rcnBjLnNjaGVtYS5TdHJlYW1VcGRhdGVSDHN0cmVhbVVwZGF0ZQ==');
