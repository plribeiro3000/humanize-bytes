# -*- encoding: utf-8 -*-
require File.expand_path('../lib/humanize-bytes/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Paulo Henrique Lopes Ribeiro"]
  gem.email         = %q{plribeiro3000@gmail.com}
  gem.description   = %q{Convert Byte, Kbyte, MByte, Gbyte into each other}
  gem.summary       = %q{Humanize bytes Gem}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "humanize-bytes"
  gem.require_paths = %w(lib)
  gem.version       = Humanize::Bytes::VERSION

  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec", ">= 2.0.0"
end