#!/usr/bin/env bash

GIT_DIR=$(git rev-parse --git-dir)

echo "Installing hooks..."
# this command creates symlink to our pre-commit script
ln -s ../../bin/git/pre-commit.bash $GIT_DIR/hooks/pre-commit
ln -s ../../bin/git/pre-push.bash $GIT_DIR/hooks/pre-push
echo "Done!"
