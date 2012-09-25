# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dummy_gen/version'

Gem::Specification.new do |gem|
  gem.name          = "dummy_gen-rails"
  gem.version       = DummyGen::VERSION
  gem.authors       = ["Scott M. Kroll"]
  gem.email         = ["skroll@gmail.com"]
  gem.description   = %q{Generator for creating a dummy application for use in Rails 3 engine development.}
  gem.summary       = gem.description
  gem.homepage      = "https://github.com/skroll/dummy_gen-rails"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "rails", "~> 3.2"
end

