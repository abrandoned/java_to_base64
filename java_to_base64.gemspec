# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'java_to_base64/version'

Gem::Specification.new do |gem|
  gem.name          = "java_to_base64"
  gem.version       = JavaToBase64::VERSION
  gem.authors       = ["Brandon Dewitt"]
  gem.email         = ["brandonsdewitt@gmail.com"]
  gem.description   = %q{ simple utility module to provide to_base64 and from_base64 for java objects }
  gem.summary       = %q{ simple utility module to provide to_base64 and from_base64 for java objects }
  gem.homepage      = ""
  gem.platform      = "java"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'i_can_has_java_class'

  gem.add_development_dependency "bundler"
  gem.add_development_dependency "mocha"
  gem.add_development_dependency "pry"
  gem.add_development_dependency "rake"
end
