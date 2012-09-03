# -*- encoding: utf-8 -*-
require File.expand_path('../lib/capistrano/lingr/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Hiroshi Yoshida"]
  gem.email         = ["hrysd22@gmail.com"]
  gem.description   = %q{notify to Lingr after deploy by Capistrano}
  gem.summary       = %q{Capistrano Lingr}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "capistrano-lingr"
  gem.require_paths = ["lib"]
  gem.version       = Capistrano::Lingr::VERSION

  gem.add_dependency 'capistrano', '>= 2'

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'webmock'
end
