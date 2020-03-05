#!/usr/bin/env bash

set -euvo pipefail

# This script assumes that it is running from the root of the Wit workspace.
api_scala_sifive_path=./api-scala-sifive
fetch_ivy_dependencies=$api_scala_sifive_path/fetch_ivy_dependencies
tests_path=$api_scala_sifive_path/tests

wake --init .

# This is gross because we don't have a way of preventing Wake from
# automatically picking up .wake files that only make sense in specific contexts
# such as testing.
test_wake_files=$(find . -name '*.wake.template')
for file in $test_wake_files
do
  echo "ln -snf \"$(basename $file)\" \"${file%.*}\""
  ln -snf "$(basename $file)" "${file%.*}"
done


ivy_dep_files=$(find $tests_path -name 'ivydependencies.json' -maxdepth 2)
$fetch_ivy_dependencies --scala scala --cache ivycache $ivy_dep_files

wake runAPIScalaSiFiveTests Unit
