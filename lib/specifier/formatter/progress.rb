module Specifier
  module Formatter
    PASS = '+'.freeze
    FAIL = '-'.freeze

    # A custom defintion for formatting the specifier results.
    #
    # Usage:
    #
    #   formatter = Specifier::Formatter::Progress.new
    #   formatter.record(example, result)
    #   formatter.summarize
    #
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
        when :pass then PASS
        when :fail then FAIL
        end
      end

    end

  end
end
