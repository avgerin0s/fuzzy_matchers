# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fuzzy_matcher/version'

Gem::Specification.new do |spec|
  spec.name          = "fuzzy_matchers"
  spec.version       = FuzzyMatcher::VERSION
  spec.authors       = ["Angel Avgerinos"]
  spec.email         = ["evaggelos.avgerinos@gmail.com"]
  spec.description   = %q{A fuzzy matcher that checks equality for complex data}
  spec.summary       = %q{A fuzzy matcher}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rake"
end
