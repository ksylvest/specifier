module Specifier
  module Formatter
    # A base defintion for formatting the specifier results.
    #
    # Usage:
    #
    #   formatter = Specifier::Formatter::Base.new
    #   formatter.record(example, result)
    #   formatter.summarize
    #
    class Base
      Recording = Struct.new(:example, :result) do
        # @return [Symbol]
        def status
          result.status
        end

        # @return [Boolean]
        def pass?
          status.eql?(:pass)
        end

        # @return [Boolean]
        def fail?
          status.eql?(:fail)
        end
      end

      # @param logger [Specifier::Logger]
      def initialize(logger)
        @logger = logger
        @recordings = []
        @contexts = []
      end

      # @param example [Specifier::Example]
      # @param result [Specifier::Example::Result]
      #
      # @return [void]
      def record(example, result)
        @recordings << Recording.new(example, result)
      end

      # @param context [Specifier::Context]
      #
      # @return [void]
      def context(context)
        @contexts << context
        yield
      end

      # @return [void]
      def summarize
        @logger.log
        @logger.log(summary)
      end

    protected

      # @return [Array<Recording>]
      def passed
        @recordings.select(&:pass?)
      end

      # @return [Array<Recording>]
      def failed
        @recordings.select(&:fail?)
      end

      # @return [String]
      def summary
        <<~SUMMARY
          Total: #{Colorizer.muted(@recordings.count)}
          Passed: #{Colorizer.passed(passed.count)}
          Failed: #{Colorizer.failed(failed.count)}
        SUMMARY
      end
    end
  end
end
