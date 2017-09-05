require 'byebug'

module Specifier

  # Defines a context that can be deeply nested (evaluates from oldest to newest in ancestry).
  #
  # Usage:
  #
  #   let "..." do
  #     # ...
  #   end
  #
  #   it "..." do
  #     # ...
  #   end
  #
  #   describe "..." do
  #   end
  #
  class Context
    attr_accessor :parent

    def self.setup(scope, parent = nil, &block)
      context = Context.new(scope, &block)
      context.parent = parent
      context.run
      context
    end

    def initialize(scope, &block)
      @scope = scope
      @block = block
      @examples = []
      @definitions = []
    end

    def describe(scope, &block)
      self.class.setup(scope, self, &block)
    end

    def let(name, &block)
      definition = Definition.new(name, &block)
      @definitions << definition
      definition
    end

    def it(descriptor, &block)
      example = Example.new(descriptor, &block)
      @examples << example
      example
    end

    def run
      instance_eval(&@block)
      @examples.each do |example|
        setup(example)
        result = example.run
        Specifier.formatter.record(example, result)
      end
    end

    def setup(example)
      parent&.setup(example)
      @definitions.each do |definition|
        definition.define(example)
      end
    end

  end
end
