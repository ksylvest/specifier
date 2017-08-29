require 'byebug'

module Specifier
  class Context
    attr_accessor :parent

    def self.setup(scope, parent = nil, &block)
      context = Context.new(scope, &block)
      context.parent = parent
      context.run
      context
    end

    def initialize(scope, &block)
      @_scope = scope
      @_block = block
      @_examples = Set.new
    end

    def describe(scope, &block)
      self.class.setup(scope, &block)
    end

    def it(descriptor, &block)
      example = Example.new(descriptor, &block)
      @_examples << example
      example
    end

    def run
      instance_eval(&@_block)
      @_examples.each do |example|
        Specifier.formatter.record(example, example.run)
      end
    end

  end
end
