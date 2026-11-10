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
    # @!attribute [rw] parent
    #   @return [Specifier::Context, nil]
    attr_accessor :parent

    # @!attribute [rw] children
    #   @return [Array<Specifier::Context>]
    attr_accessor :children

    # @!attribute [rw] description
    #   @return [String, Module]
    attr_accessor :description

    # @param description [String, Module]
    # @param parent [Specifier::Context, nil]
    # @param block [Proc]
    #
    # @return [Specifier::Context]
    def self.setup(description, parent = nil, &block)
      context = new(description, &block)
      if parent
        context.parent = parent
        parent.children << context
      end
      context.instance_eval(&block)
      context
    end

    # @param description [String, Module]
    # @param block [Proc]
    def initialize(description, &block)
      @description = description
      @block = block
      @children = []
      @examples = []
      @definitions = []
    end

    # @param description [String, Module]
    # @param block [Proc]
    #
    # @return [Specifier::Context]
    def describe(description, &block)
      self.class.setup(description, self, &block)
    end

    # @param name [Symbol]
    # @param block [Proc]
    #
    # @return [Specifier::Definition]
    def let(name, &block)
      definition = Definition.new(name, &block)
      @definitions << definition
      definition
    end

    # @param description [String]
    # @param block [Proc]
    #
    # @return [Specifier::Example]
    def it(description, &block)
      example = Example.new(description, &block)
      @examples << example
      example
    end

    # @return [void]
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

    # @param world [Specifier::World]
    #
    # @return [void]
    def setup(world)
      parent&.setup(world)
      @definitions.each do |definition|
        definition.define(world)
      end
    end
  end
end
