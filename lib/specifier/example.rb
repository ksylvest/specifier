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

    attr_accessor :description

    def initialize(description, &block)
      @description = description
      @block = block
    end

    def run(world)
      world.instance_eval(&@block)
      return Result.new(:pass)
    rescue Specifier::Expectation::Miss => miss
      return Result.new(:fail, miss.message)
    end

  end
end
