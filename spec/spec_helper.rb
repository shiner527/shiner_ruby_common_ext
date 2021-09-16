# frozen_string_literal: true

# 加载覆盖率 gem 相关
require 'simplecov'
SimpleCov.start

require 'bundler/setup'
require 'shiner_ruby_common_ext'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
