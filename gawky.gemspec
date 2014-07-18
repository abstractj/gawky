# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gawky/version'

Gem::Specification.new do |spec|
  spec.name          = "gawky"
  spec.version       = Gawky::VERSION
  spec.authors       = ["Bruno Oliveira"]
  spec.email         = ["bruno@abstractj.org"]
  spec.summary       = %q{A tiny and simple console tool for pull requests}
  spec.description   = %q{Pull request console wrapper}
  spec.homepage      = "https://github.com/abstractj/gawky"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'github_api', '~> 0.11.3'
  spec.add_dependency 'term-ansicolor', '~> 1.3.0'
  spec.add_dependency 'json', '~> 1.8.1'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
