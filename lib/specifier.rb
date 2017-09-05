require 'find'
require 'slop'

require 'specifier/version'
require 'specifier/cli'
require 'specifier/config'
require 'specifier/logger'
require 'specifier/runner'
require 'specifier/context'
require 'specifier/definition'
require 'specifier/example'
require 'specifier/expectation'
require 'specifier/matcher'
require 'specifier/memoizer'
require 'specifier/formatter'

module Specifier

  def self.specify(scope, &block)
    Context.setup(scope, &block)
  end

  def self.config
    @config ||= Config.new
  end

  def self.logger
    @logger ||= Logger.new
  end

  def self.formatter
    @formatter ||= Formatter.formatters[config.formatter].new(logger)
  end

end
