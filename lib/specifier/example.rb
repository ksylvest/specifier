module Specifier

  # Configures an example (used for it statements).
  #
  # Usage:
  #
  #   example = Specifier::Example.new("...") do
  #     expect(value).to equal(value)
  #   end
  #
  #   world = Specifier::World.new
  #   example.run(world)
  #
  class Example
    Result = Struct.new(:status, :message)

    # @!attribute [rw] description
    #   @return [String]
    attr_accessor :description

    # @param description [String]
    # @param block [Proc]
    def initialize(description, &block)
      @description = description
      @block = block
    end

    # @param world [Specifier::World]
    #
    # @return [Specifier::Example::Result]
    def run(world)
      world.instance_eval(&@block)
      Result.new(:pass)
    rescue StandardError => e
      Result.new(:fail, e)
    end
  end
end
