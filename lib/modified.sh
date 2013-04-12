#!/bin/bash -e
FILES="$(git ls-files --unmerged)"
if [[ -n "$FILES" ]]; then
  echo "$FILES" | awk '{print $4}' | sort -u
else
  FILES="$(git status --porcelain -z --untracked-files=all | tr '\0' '\n')"
  if [[ -n "$FILES" ]]; then
    echo "$FILES" | cut -c 4- | tr '\n' '\0' | xargs -0 find 2> /dev/null
  fi
fi
