{.push raises: [].}

import std/os
import pkg/cozo/abi

const
  # engine = "sqlite"
  engine = "rocksdb"
  path = "data" / "cozo1.db"
  options = "{}"

var dbId: int32

createDir path.parentDir

let resOpenCstr = cozo_open_db(
  engine.cstring, path.cstring, options.cstring, addr dbId)

var resOpen = "success"

if not resOpenCstr.isNil:
  resOpen = $resOpenCstr
  cozo_free_str resOpenCstr

echo resOpen
echo dbId

let resClose = cozo_close_db dbId

echo resClose
