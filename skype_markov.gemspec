# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'skype_markov/version'

Gem::Specification.new do |spec|
  spec.name          = "skype_markov"
  spec.version       = SkypeMarkov::VERSION
  spec.authors       = ["Conrad King"]
  spec.email         = ["rainbowryke@gmail.com"]
  spec.summary       = %q{Markov chain based Skype bot.}
  spec.description   = %q{A Skype bot that posts messages generated from Markov chains based on individual user's chat history.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  
  spec.add_runtime_dependency "skype", "~> 0.2.8"
  spec.add_runtime_dependency "ruby-dbus", "~> 0.11.0" if RUBY_PLATFORM =~ /linux/i
  spec.add_runtime_dependency "marky_markov", "~> 0.3.5"
end
