#!/bin/sh -e
("$(dirname "$0")/branch.sh" && "$(dirname "$0")/modified.sh") | sort -u
