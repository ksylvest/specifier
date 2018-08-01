module Specifier
  module Formatter

    # A custom defintion for formatting the specifier results.
    #
    # Usage:
    #
    #   formatter = Specifier::Formatter::Documentation.new
    #   formatter.context(context) do
    #     formatter.record(example, result)
    #   end
    #   formatter.summarize
    #
    class Documentation < Base
      INDENTATION = '  '.freeze
      NAME = 'documentation'.freeze
      PASS = '[PASS]'.freeze
      FAIL = '[FAIL]'.freeze

      Formatter.formatters[NAME] = self

      def initialize(logger)
        super
        @indentation = 0
      end

      def record(example, result)
        super

        message =
          case result.status
          when :pass then Colorizer.passed(indent("#{PASS} #{example.description}"))
          when :fail then Colorizer.failed(indent("#{FAIL} #{example.description}"))
          end

        @logger.log(message)
      end

      def context(context)
        @logger.log(indent(context.description))

        @indentation = @indentation.next
        super
        @indentation = @indentation.pred
      end

    private

      def indent(message)
        INDENTATION * @indentation + String(message)
      end

    end

  end
end
