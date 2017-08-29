module Specifier
  module Formatter
    class Progress < Base
      def record(example, result)
        super
        @logger << symbol(result)
      end

    private

      def symbol(result)
        case result.status
        when :pass then '+'
        when :fail then '-'
        end
      end

    end
  end
end
