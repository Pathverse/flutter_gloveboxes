#!/bin/bash

commit_msg_file="$1"
commit_msg=$(cat "$commit_msg_file")
branch=$(git rev-parse --abbrev-ref HEAD)

# Regexes
standard_regex='^(feat|fix|docs|style|refactor|perf|test|chore)(\(![^\)]*\)|\([^\)]*\)|!)?: .+'
main_regex='^\[*\] (feat|fix|docs|style|refactor|perf|test|chore)(\(![^\)]*\)|\([^\)]*\)|!)?: .+'

if [[ "$branch" == "main" ]]; then
  if ! [[ "$commit_msg" =~ $main_regex ]]; then
    echo "❌ Invalid commit message on 'main'."
    echo "Expected format: [ref] type(scope)?: message"
    echo "Example: [ref] feat!: breaking change message"
    exit 1
  fi
else
  if ! [[ "$commit_msg" =~ $standard_regex ]]; then
    echo "❌ Invalid commit message."
    echo "Expected format: type(scope)?: message"
    echo "Supports breaking change syntax: feat!: ..."
    exit 1
  fi
fi
