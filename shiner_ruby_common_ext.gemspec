# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'shiner_ruby_common_ext/version'

Gem::Specification.new do |spec|
  spec.name          = 'shiner_ruby_common_ext'
  spec.version       = ShinerRubyCommonExt::VERSION
  spec.authors       = ['shiner']
  spec.email         = ['shiner527@hotmail.com']

  spec.summary       = 'Some useful extends for basic classes suck as Time, Array and Hash, etc.'
  spec.description   = 'Some useful extends for basic classes suck as Time, Array and Hash, etc.'
  spec.homepage      = 'https://github.com/shiner527/shiner_ruby_common_ext'
  spec.license       = 'MIT'

  # spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/shiner527/shiner_ruby_common_ext'
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'yard'
end
