# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
Gem::Specification.new do |s|
  s.name        = 'bluepark'
  s.version     = '1.0.2'
  s.date        = '2017-07-28'
  s.summary     = "Ruby client library for the Bluepark API"
  s.description = "A simple client created to help with Bluepark integration"
  s.authors     = ["Andriy Byalyk"]
  s.email       = ['rewrite.andriy@gmail.com', 'andriy.b@coaxsoft.com']
  s.require_paths = ['lib']
  s.files       = Dir['lib/**/*','bluepark.gemspec']
  s.license       = 'MIT'
  s.add_development_dependency 'bundler', '~> 1.14.6'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rake', '~> 12.0.0'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'vcr'
  s.add_development_dependency 'webmock'
  s.add_dependency 'oj', '~> 3.3.1'
  s.add_dependency 'rest-client', '~> 2.0.2'
end
