#!/bin/bash -e
if [[ -n "$(git diff $(git merge-base origin/HEAD HEAD).. --name-only)" ]]; then
  git diff $(git merge-base origin/HEAD HEAD).. --name-only | sort -u | xargs find 2> /dev/null
fi
