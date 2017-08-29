module Specifier
  module Formatter
    class Base
      Recording = Struct.new(:example, :result) do
        def status
          result.status
        end

        def pass?
          status.eql?(:pass)
        end

        def fail?
          status.eql?(:fail)
        end
      end

      def initialize(logger)
        @logger = logger
        @recordings = []
      end

      def record(example, result)
        @recordings << Recording.new(example, result)
      end

      def passed
        @recordings.select(&:pass?)
      end

      def failed
        @recordings.select(&:fail?)
      end

      def summarize
        @logger.log
        @logger.log(summary)
      end

      def summary
        <<~SUMMARY
          Total: #{@recordings.count}
          Passed: #{passed.count}
          Failed: #{failed.count}
        SUMMARY
      end
    end
  end
end
