#!/usr/bin/env bash

echo "Running pre-push hook"
# ./scripts/run-brakeman.bash
./bin/git/run-tests.bash

# $? stores exit value of the last command
if [ $? -ne 0 ]; then
  echo "Brakeman and Tests must pass before pushing!"
  exit 1
fi

# check yard
./bin/git/run-yard.bash
if [ $? -ne 0 ]; then
  echo "Project is not enough documented by YARD!"
  exit 1
fi
