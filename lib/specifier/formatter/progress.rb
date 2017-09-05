module Specifier
  module Formatter
    class Progress < Base
      NAME = 'progress'.freeze
      Formatter.formatters[NAME] = self

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
