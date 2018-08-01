module Specifier
  module Formatter

    # A custom defintion for formatting the specifier results.
    #
    # Usage:
    #
    #   formatter = Specifier::Formatter::Progress.new
    #   formatter.context(context) do
    #     formatter.record(example, result)
    #   end
    #   formatter.summarize
    #
    class Progress < Base
      NAME = 'progress'.freeze
      PASS = '+'.freeze
      FAIL = '-'.freeze

      Formatter.formatters[NAME] = self

      def record(example, result)
        super

        message =
          case result.status
          when :pass then Specifier::Colorizer.passed(PASS)
          when :fail then Specifier::Colorizer.failed(FAIL)
          end

        @logger << message
      end

    end

  end
end
