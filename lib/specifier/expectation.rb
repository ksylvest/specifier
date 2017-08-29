module Specifier
  class Expectation
    class Miss < StandardError
      def initialize(message)
        @message = message
      end
    end

    def initialize(value)
      @value = value
    end

    def to(matcher)
      raise Miss, matcher.message unless matcher.match?(@value)
    end
  end
end
