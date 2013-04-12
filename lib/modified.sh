#!/bin/bash -e
if [[ -n "$(git ls-files --unmerged)" ]]; then
  git ls-files --unmerged | awk '{print $4}' | sort -u
else
  if [[ -n "$(git status --porcelain -z --untracked-files=all)" ]]; then
    git status --porcelain -z --untracked-files=all | tr '\0' '\n' | cut -c 4- | tr '\n' '\0' | xargs -0 find 2> /dev/null
  fi
fi
