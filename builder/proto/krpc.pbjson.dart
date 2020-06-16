///
//  Generated code. Do not modify.
//  source: krpc.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const ConnectionRequest$json = const {
  '1': 'ConnectionRequest',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.krpc.schema.ConnectionRequest.Type', '10': 'type'},
    const {'1': 'client_name', '3': 2, '4': 1, '5': 9, '10': 'clientName'},
    const {'1': 'client_identifier', '3': 3, '4': 1, '5': 12, '10': 'clientIdentifier'},
  ],
  '4': const [ConnectionRequest_Type$json],
};

const ConnectionRequest_Type$json = const {
  '1': 'Type',
  '2': const [
    const {'1': 'RPC', '2': 0},
    const {'1': 'STREAM', '2': 1},
  ],
};

const ConnectionResponse$json = const {
  '1': 'ConnectionResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.krpc.schema.ConnectionResponse.Status', '10': 'status'},
    const {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'client_identifier', '3': 3, '4': 1, '5': 12, '10': 'clientIdentifier'},
  ],
  '4': const [ConnectionResponse_Status$json],
};

const ConnectionResponse_Status$json = const {
  '1': 'Status',
  '2': const [
    const {'1': 'OK', '2': 0},
    const {'1': 'MALFORMED_MESSAGE', '2': 1},
    const {'1': 'TIMEOUT', '2': 2},
    const {'1': 'WRONG_TYPE', '2': 3},
  ],
};

const Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'calls', '3': 1, '4': 3, '5': 11, '6': '.krpc.schema.ProcedureCall', '10': 'calls'},
  ],
};

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

const Argument$json = const {
  '1': 'Argument',
  '2': const [
    const {'1': 'position', '3': 1, '4': 1, '5': 13, '10': 'position'},
    const {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
};

const Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'error', '3': 1, '4': 1, '5': 11, '6': '.krpc.schema.Error', '10': 'error'},
    const {'1': 'results', '3': 2, '4': 3, '5': 11, '6': '.krpc.schema.ProcedureResult', '10': 'results'},
  ],
};

const ProcedureResult$json = const {
  '1': 'ProcedureResult',
  '2': const [
    const {'1': 'error', '3': 1, '4': 1, '5': 11, '6': '.krpc.schema.Error', '10': 'error'},
    const {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
};

const Error$json = const {
  '1': 'Error',
  '2': const [
    const {'1': 'service', '3': 1, '4': 1, '5': 9, '10': 'service'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'stack_trace', '3': 4, '4': 1, '5': 9, '10': 'stackTrace'},
  ],
};

const StreamUpdate$json = const {
  '1': 'StreamUpdate',
  '2': const [
    const {'1': 'results', '3': 1, '4': 3, '5': 11, '6': '.krpc.schema.StreamResult', '10': 'results'},
  ],
};

const StreamResult$json = const {
  '1': 'StreamResult',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 4, '10': 'id'},
    const {'1': 'result', '3': 2, '4': 1, '5': 11, '6': '.krpc.schema.ProcedureResult', '10': 'result'},
  ],
};

const Services$json = const {
  '1': 'Services',
  '2': const [
    const {'1': 'services', '3': 1, '4': 3, '5': 11, '6': '.krpc.schema.Service', '10': 'services'},
  ],
};

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

const Parameter$json = const {
  '1': 'Parameter',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'type', '3': 2, '4': 1, '5': 11, '6': '.krpc.schema.Type', '10': 'type'},
    const {'1': 'default_value', '3': 3, '4': 1, '5': 12, '10': 'defaultValue'},
  ],
};

const Class$json = const {
  '1': 'Class',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'documentation', '3': 2, '4': 1, '5': 9, '10': 'documentation'},
  ],
};

const Enumeration$json = const {
  '1': 'Enumeration',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'values', '3': 2, '4': 3, '5': 11, '6': '.krpc.schema.EnumerationValue', '10': 'values'},
    const {'1': 'documentation', '3': 3, '4': 1, '5': 9, '10': 'documentation'},
  ],
};

const EnumerationValue$json = const {
  '1': 'EnumerationValue',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'value', '3': 2, '4': 1, '5': 5, '10': 'value'},
    const {'1': 'documentation', '3': 3, '4': 1, '5': 9, '10': 'documentation'},
  ],
};

const Exception$json = const {
  '1': 'Exception',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'documentation', '3': 2, '4': 1, '5': 9, '10': 'documentation'},
  ],
};

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

const Tuple$json = const {
  '1': 'Tuple',
  '2': const [
    const {'1': 'items', '3': 1, '4': 3, '5': 12, '10': 'items'},
  ],
};

const List_$json = const {
  '1': 'List',
  '2': const [
    const {'1': 'items', '3': 1, '4': 3, '5': 12, '10': 'items'},
  ],
};

const Set$json = const {
  '1': 'Set',
  '2': const [
    const {'1': 'items', '3': 1, '4': 3, '5': 12, '10': 'items'},
  ],
};

const Dictionary$json = const {
  '1': 'Dictionary',
  '2': const [
    const {'1': 'entries', '3': 1, '4': 3, '5': 11, '6': '.krpc.schema.DictionaryEntry', '10': 'entries'},
  ],
};

const DictionaryEntry$json = const {
  '1': 'DictionaryEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 12, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
};

const Stream$json = const {
  '1': 'Stream',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 4, '10': 'id'},
  ],
};

const Event$json = const {
  '1': 'Event',
  '2': const [
    const {'1': 'stream', '3': 1, '4': 1, '5': 11, '6': '.krpc.schema.Stream', '10': 'stream'},
  ],
};

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

const MultiplexedRequest$json = const {
  '1': 'MultiplexedRequest',
  '2': const [
    const {'1': 'connection_request', '3': 1, '4': 1, '5': 11, '6': '.krpc.schema.ConnectionRequest', '10': 'connectionRequest'},
    const {'1': 'request', '3': 2, '4': 1, '5': 11, '6': '.krpc.schema.Request', '10': 'request'},
  ],
};

const MultiplexedResponse$json = const {
  '1': 'MultiplexedResponse',
  '2': const [
    const {'1': 'response', '3': 1, '4': 1, '5': 11, '6': '.krpc.schema.Response', '10': 'response'},
    const {'1': 'stream_update', '3': 2, '4': 1, '5': 11, '6': '.krpc.schema.StreamUpdate', '10': 'streamUpdate'},
  ],
};

