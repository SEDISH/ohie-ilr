#!/usr/bin/env bash
HEAP=8g
# Path to this script

FILE="${BASH_SOURCE[0]}"
while [ -h "$FILE" ] ; do
SRC="$(readlink "$FILE")"
FILE="$( cd -P "$(dirname "$FILE")" && \
         cd -P "$(dirname "$SRC")" && pwd )/$(basename "$SRC")"
done

BX="$( cd -P "$(dirname "$FILE")/.." && pwd )"
# API, core, and library classes
CP="$BX/BaseX.jar$(printf ":%s" "$BX/lib/"*.jar "$BXCORE/lib/"*.jar)"
# Options for virtual machine (can be extended by global options)
BASEX_JVM="-Xmx$HEAP $BASEX_JVM"

# Run code
java -cp "$CP" $BASEX_JVM org.basex.BaseXHTTP "$@"
