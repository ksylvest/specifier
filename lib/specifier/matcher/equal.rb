module Specifier
  module Matcher
    class Equal < Base
      def initialize(value)
        super()
        @value = value
      end

      def match?(expected)
        super
        expected.eql?(@value)
      end

      def message
        "expected #{@expected.inspect} got #{@value.inspect}"
      end
    end
  end
end
