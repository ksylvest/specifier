require 'find'
require 'slop'

require 'specifier/version'
require 'specifier/cli'
require 'specifier/colorizer'
require 'specifier/config'
require 'specifier/logger'
require 'specifier/runner'
require 'specifier/world'
require 'specifier/context'
require 'specifier/definition'
require 'specifier/example'
require 'specifier/expectation'
require 'specifier/matcher'
require 'specifier/memoizer'
require 'specifier/formatter'

module Specifier
  def self.contexts
    @contexts ||= []
  end

  def self.specify(scope, &block)
    contexts << Context.setup(scope, &block)
  end

  def self.run
    contexts.each(&:run)
  end

  def self.config
    @config ||= Config.new
  end

  def self.logger
    @logger ||= Logger.new
  end

  def self.formatter
    @formatter ||= Formatter.formatters[config.formatter || Specifier::Formatter::DEFAULT].new(logger)
  end

end
