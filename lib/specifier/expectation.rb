module Specifier
  # Configures an expectation (used for expect statements).
  #
  # Usage:
  #
  #   expectation = Specifier::Expectation.new("today")
  #   expectation.to(matcher) # 'raises 'ToError'
  #
  class Expectation
    class MatcherError < StandardError
    end

    def initialize(value)
      @value = value
    end

    def to(matcher)
      raise MatcherError, matcher.message unless matcher.match?(@value)
    end
  end
end
