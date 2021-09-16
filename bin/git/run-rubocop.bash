#!/usr/bin/env bash

# 提交前检测代码风格

set -e

cd "${0%/*}/../.."

echo "Running rubocop"
bundle exec rubocop
