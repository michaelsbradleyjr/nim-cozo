const cozo_header = "cozo_c.h"

when defined(coverage):
  import ./coverage
  macro cozo(procedure: untyped): untyped =
    result = quote do:
      coverageWrapper(`procedure`, cozo_header)
else:
  {.pragma: cozo, cdecl, header: cozo_header, importc.}

proc cozo_open_db*(engine, path, options: cstring, db_id: ptr int32): cstring {.cozo.}

proc cozo_close_db*(db_id: int32): bool {.cozo.}

proc cozo_run_query*(db_id: int32, script_raw, params_raw: cstring, immutable_query: bool): cstring {.cozo.}

proc cozo_import_relations*(db_id: int32, json_payload: cstring): cstring {.cozo.}

proc cozo_export_relations*(db_id: int32, json_payload: cstring): cstring {.cozo.}

proc cozo_backup*(db_id: int32, out_path: cstring): cstring {.cozo.}

proc cozo_restore*(db_id: int32, in_path: cstring): cstring {.cozo.}

proc cozo_import_from_backup*(db_id: int32, json_payload: cstring): cstring {.cozo.}

proc cozo_free_str*(s: cstring) {.cozo.}
