module Specifier
  class Example
    Result = Struct.new(:status, :message)

    def initialize(descriptor, &block)
      @_descriptor = descriptor
      @_block = block
    end

    def expect(value)
      Expectation.new(value)
    end

    def equal(value)
      Matcher::Equal.new(value)
    end

    def run
      instance_eval(&@_block)
      return Result.new(:pass)
    rescue Specifier::Expectation::Miss => miss
      return Result.new(:fail, miss.message)
    end

  end
end
