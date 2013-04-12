#!/bin/bash -e
git diff $(git merge-base origin/HEAD HEAD).. --name-only | sort -u | xargs find 2> /dev/null
