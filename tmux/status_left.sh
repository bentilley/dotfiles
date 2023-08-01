#!/usr/bin/env sh

sed <"$(git rev-parse --absolute-git-dir)/HEAD" \
  -Ee 's/ref: refs\/heads\///'
