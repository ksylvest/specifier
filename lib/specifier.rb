require 'find'
require 'slop'

require 'specifier/version'
require 'specifier/cli'
require 'specifier/config'
require 'specifier/logger'
require 'specifier/runner'
require 'specifier/context'
require 'specifier/example'
require 'specifier/expectation'
require 'specifier/matcher'
require 'specifier/formatter'

module Specifier

  def self.specify(scope, &block)
    Context.setup(scope, &block)
  end

  def self.logger
    @logger ||= Logger.new
  end

  def self.formatter
    @formatter ||= Formatter::Progress.new(logger)
  end

end
