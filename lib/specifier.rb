require "find"
require "slop"

require "zeitwerk"

loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect("cli" => "CLI")
loader.setup

module Specifier
  # @return [Array<Specifier::Context>]
  def self.contexts
    @contexts ||= []
  end

  # @param scope [String, Module]
  # @param block [Proc]
  #
  # @return [Array<Specifier::Context>]
  def self.specify(scope, &block)
    contexts << Context.setup(scope, &block)
  end

  # @return [Array<Specifier::Context>]
  def self.run
    contexts.each(&:run)
  end

  # @return [Specifier::Config]
  def self.config
    @config ||= Config.new
  end

  # @return [Specifier::Logger]
  def self.logger
    @logger ||= Logger.new
  end

  # @return [Specifier::Formatter::Base]
  def self.formatter
    @formatter ||= Formatter.formatters[config.formatter || Specifier::Formatter::DEFAULT].new(logger)
  end
end
