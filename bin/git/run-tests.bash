#!/usr/bin/env bash

# 推送前测试

set -e

cd "${0%/*}/../.."

echo "Running tests"

bundle exec rspec
