#!/bin/sh -e
FILES="$(git diff $(git merge-base origin/HEAD HEAD 2> /dev/null || (git remote set-head origin -a > /dev/null && git merge-base origin/HEAD HEAD)).. --name-only)"
if [ -n "$FILES" ]; then
  echo "$FILES" | sort -u | xargs find 2> /dev/null || true
fi
