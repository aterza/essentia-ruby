# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'essentia/version'

Gem::Specification.new do |spec|
  spec.name          = "essentia_ruby"
  spec.version       = Essentia::Ruby::VERSION
  spec.authors       = ["Nicola Bernardini"]
  spec.email         = ['n.bernardini@conservatoriosantacecilia.it']
  spec.extensions    = ["ext/essentia_ruby/extconf.rb"]
  spec.summary       = %q{A ruby wrap for the Essentia libray}
  spec.description   = %q{A SWIG-based ruby wrap of the Essentia MIR library by the MTG (https://github.com/MTG/essentia)}
  spec.homepage      = "https://github.com/nicb/essentia-ruby"
  spec.license       = "GNU GPL 3.0"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rake-compiler"
  spec.add_development_dependency "rspec"
  spec.add_dependency "rice", "~> 2.1.1"
end
