# coding: utf-8

$:.push File.join(File.dirname(__FILE__), 'lib')
require 'specifier/version'

Gem::Specification.new do |spec|
  spec.name = 'specifier'
  spec.version = Specifier::VERSION
  spec.authors = ['Kevin Sylvestre']
  spec.email = ['kevin@ksylvest.com']

  spec.summary = 'A testing framework written for fun.'
  spec.description = 'Thi should probably never be used.'
  spec.homepage = 'https://github.com/ksylvest/specifier'
  spec.license = 'MIT'

  spec.files = Dir.glob('{bin,lib}/**/*') + ['README.md', 'LICENSE' 'Gemfile']

  spec.bindir = 'bin'
  spec.executables = ['specifier']
  spec.require_paths = ['lib']

  spec.add_dependency 'slop'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'simplecov'
end
