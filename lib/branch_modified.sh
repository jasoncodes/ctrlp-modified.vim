#!/bin/sh -e

TEMP_FILE="$(mktemp "${TMPDIR:-/tmp}/ctrlp-modified.XXXXXX")"
trap '{ rm -f "$TEMP_FILE"; }' EXIT

("$(dirname "$0")/branch.sh" && "$(dirname "$0")/modified.sh") | sort -u > "$TEMP_FILE"

grep / "$TEMP_FILE" || true
grep -v / "$TEMP_FILE" || true
