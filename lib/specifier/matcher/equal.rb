module Specifier
  module Matcher
    class Equal < Base
      # @param value [Object]
      def initialize(value)
        super()
        @value = value
      end

      # @param expected [Object]
      #
      # @return [Boolean]
      def match?(expected)
        super
        expected.eql?(@value)
      end

      # @return [String]
      def message
        "expected #{@expected.inspect} got #{@value.inspect}"
      end
    end
  end
end
