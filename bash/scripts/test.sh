#!/usr/bin/env sh

WATCH_MODE=0
FILE=""
TEST=""

while [ $# -gt 0 ]; do
  case "$1" in
  --watch)
    WATCH_MODE=1
    shift
    ;;
  --just-file)
    FILE="$2"
    shift 2
    ;;
  --file)
    FILE="$2"
    shift 2
    ;;
  --just-test)
    TEST="$2"
    shift 2
    ;;
  --test)
    TEST="$2"
    shift 2
    ;;
  *)
    echo "Unknown argument: $1" >&2
    exit 1
    ;;
  esac
done

if [ -z "$TEST" ]; then
  echo "Error: --test argument is required." >&2
  exit 1
fi

if [ -z "$FILE" ]; then
  echo "Error: --file argument is required." >&2
  exit 1
fi

if [ "$WATCH_MODE" -eq 1 ]; then
  ls "$FILE" | entr bats "$TEST"
else
  bats "$TEST"
fi
