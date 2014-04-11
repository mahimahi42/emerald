# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'emerald/version'

Gem::Specification.new do |spec|
  spec.name          = "emerald"
  spec.version       = Emerald::VERSION
  spec.authors       = ["Bryce Davis"]
  spec.email         = ["bad1128@gmail.com"]
  spec.summary       = %q{The Emerald Programming Language}
  spec.description   = %q{Emerald is a simple programming language inspired by Ruby and C, mostly so I can learn language development.}
  spec.homepage      = "https://github.com/mahimahi42/emerald"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"

  spec.add_runtime_dependency "rex"
  spec.add_runtime_dependency "racc"
end
