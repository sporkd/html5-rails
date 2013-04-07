# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "html5/rails/version"

Gem::Specification.new do |s|
  s.name        = "html5-rails"
  s.version     = Html5::Rails::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Peter Gumeson"]
  s.email       = ["gumeson@gmail.com"]
  s.homepage    = "http://rubygems.org/gems/html5-rails"
  s.summary     = %q{ Rails support for the compass-h5bp gem }
  s.description = %q{}

  s.rubyforge_project = "html5-rails"

  s.add_dependency "jquery-rails",  ">= 2.0"
  s.add_dependency "railties",      ">= 3.2"
  s.add_dependency "thor",          "~> 0.14"

  s.add_development_dependency "compass-h5bp", "~> 0.1.0"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
