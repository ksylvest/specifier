require 'byebug'

module Specifier
  class Context
    attr_accessor :parent

    def initialize(scope, &block)
      @_scope = scope
      @_block = block
      @_examples = Set.new
    end

    def describe(scope, &block)
      context = Context.new(scope, &block)
      context.parent = self
      context.run
    end

    def it(descriptor, &block)
      @_examples << Example.new(descriptor, &block)
    end

    def run
      instance_eval(&@_block)
      @_examples.each do |example|
        Specifier.formatter.record(example, example.run)
      end
    end

  end
end
