#!/bin/bash -e
git status --porcelain -z --untracked-files=all | tr '\0' '\n' | cut -c 4- | tr '\n' '\0' | xargs -0 find 2> /dev/null
