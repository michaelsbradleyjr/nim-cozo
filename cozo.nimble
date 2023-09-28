packageName  = "cozo"
version      = "0.7.5"
author       = "Michael Bradley, Jr."
description  = "A wrapper for CozoDB"
license      = "MPL 2.0"
installDirs  = @["cozo"]
installFiles = @["LICENSE", "cozo.nim"]

requires "nim >= 1.6.0",
         "jsony",
         "unittest2"
