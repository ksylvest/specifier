module Specifier

  # It remembers things (used for within let statements).
  #
  # Usage:
  #
  #   memoizer = Specifier::Memoizer.new do
  #     # ...
  #   end
  #   memoizer.evaluate
  #
  class Memoizer

    def initialize(&block)
      @block = block
    end

    def evaluate
      return @result if defined?(@result)

      @result = @block.call
    end

  end
end
