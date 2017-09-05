module Specifier

  # Configures an example (used for it statements).
  #
  # Usage:
  #
  #   example = Specifier::Example.new("...") do
  #     expect(value).to equal(value)
  #   end
  #
  #   example.run
  #
  class Example
    Result = Struct.new(:status, :message)

    def initialize(descriptor, &block)
      @descriptor = descriptor
      @block = block
    end

    def expect(value)
      Expectation.new(value)
    end

    def equal(value)
      Matcher::Equal.new(value)
    end

    def run
      instance_eval(&@block)
      return Result.new(:pass)
    rescue Specifier::Expectation::Miss => miss
      return Result.new(:fail, miss.message)
    end

  end
end
