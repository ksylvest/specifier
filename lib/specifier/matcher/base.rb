module Specifier
  module Matcher
    class Base
      # @!attribute [rw] expected
      #   @return [Object]
      attr_accessor :expected

      # @param expected [Object]
      #
      # @return [Object]
      def match?(expected)
        self.expected = expected
      end
    end
  end
end
