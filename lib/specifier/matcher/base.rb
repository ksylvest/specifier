module Specifier
  module Matcher
    class Base
      attr_accessor :expected

      def match?(expected)
        self.expected = expected
      end
    end
  end
end
