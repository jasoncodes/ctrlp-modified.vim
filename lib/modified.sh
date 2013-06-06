#!/bin/bash -e
if [[ -e .git/MERGE_HEAD ]] || [[ -d .git/rebase-merge ]]; then
  git status --porcelain -z | tr '\0' '\n' | grep '^[^?][^ ?] ' | cut -d ' ' -f 2-
else
  FILES="$(git status --porcelain -z --untracked-files=all | tr '\0' '\n')"
  if [[ -n "$FILES" ]]; then
    echo "$FILES" | cut -c 4- | tr '\n' '\0' | xargs -0 find 2> /dev/null
  fi
fi
