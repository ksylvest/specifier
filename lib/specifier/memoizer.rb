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
    # @param block [Proc]
    def initialize(&block)
      @block = block
    end

    # @return [Object]
    def evaluate
      return @evaluate if defined?(@evaluate)

      @evaluate = @block.call
    end
  end
end
