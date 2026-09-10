#!/bin/sh
set -eu

TMP_DB="${TMPDIR:-/tmp}/fmptools-portablecode39.sqlite"
rm -f "$TMP_DB"

./fmp2sqlite test/data/fmp12/PortableCode39-2.fmp12 "$TMP_DB"

if [ ! -s "$TMP_DB" ]; then
    echo "SQLite output was not created or is empty"
    exit 1
fi

rm -f "$TMP_DB"

echo "fmp2sqlite regression test passed"
