require 'coveralls'
Coveralls.wear!

require 'bundler/setup'
require 'specifier'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
