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

    # @param value [Object]
    def initialize(value)
      @value = value
    end

    # @param matcher [Specifier::Matcher::Base]
    #
    # @return [void]
    def to(matcher)
      raise MatcherError, matcher.message unless matcher.match?(@value)
    end
  end
end
