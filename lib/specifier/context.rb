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
    attr_accessor :children
    attr_accessor :description

    def self.setup(description, parent = nil, &block)
      context = new(description, &block)
      if parent
        context.parent = parent
        parent.children << context
      end
      context.instance_eval(&block)
      context
    end

    def initialize(description, &block)
      @description = description
      @block = block
      @children = []
      @examples = []
      @definitions = []
    end

    def describe(description, &block)
      self.class.setup(description, self, &block)
    end

    def let(name, &block)
      definition = Definition.new(name, &block)
      @definitions << definition
      definition
    end

    def it(description, &block)
      example = Example.new(description, &block)
      @examples << example
      example
    end

    def run
      Specifier.formatter.context(self) do
        @examples.each do |example|
          world = Specifier::World.new
          setup(world)
          result = example.run(world)
          Specifier.formatter.record(example, result)
        end
        @children.each(&:run)
      end
    end

    def setup(world)
      parent&.setup(world)
      @definitions.each do |definition|
        definition.define(world)
      end
    end

  end
end
