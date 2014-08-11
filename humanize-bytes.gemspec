# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'humanize/bytes'

Gem::Specification.new do |gem|
  gem.name        = 'humanize-bytes'
  gem.version     = Humanize::Bytes::VERSION
  gem.authors     = %q{Paulo Henrique Lopes Ribeiro}
  gem.email       = %q{plribeiro3000@gmail.com}
  gem.summary     = %q{Convert Byte, Kbyte, MByte, Gbyte into each other}

  gem.files         = `git ls-files`.split($\)
  gem.test_files    = `git ls-files -- {test,spec,features,examples,gemfiles}/*`.split("\n")
  gem.executables   = `git ls-files -- bin/*`.split('\n').map{ |f| File.basename(f) }
  gem.require_paths = %w(lib)

  gem.license = 'MIT'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
end