$:.push File.join(File.dirname(__FILE__), "lib")
require "specifier/version"

Gem::Specification.new do |spec|
  spec.name = "specifier"
  spec.version = Specifier::VERSION
  spec.authors = ["Kevin Sylvestre"]
  spec.email = ["kevin@ksylvest.com"]

  spec.summary = "A testing framework written for fun."
  spec.description = "This should probably never be used."
  spec.homepage = "https://github.com/ksylvest/specifier"
  spec.license = "MIT"

  spec.files = Dir.glob("{exe,lib}/**/*") + %w[README.md LICENSE Gemfile]

  spec.bindir = "exe"
  spec.executables = ["specifier"]

  spec.required_ruby_version = "> 2.5.0"

  spec.add_dependency "slop"
  spec.add_dependency "zeitwerk"
  spec.metadata["rubygems_mfa_required"] = "true"
end
