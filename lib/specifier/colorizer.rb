module Specifier

  # Used to colorize messages for console output.
  #
  # Usage:
  #
  #   Specifier::Colorizer.muted("...")
  #   Specifier::Colorizer.passed("...")
  #   Specifier::Colorizer.failed("...")
  #
  module Colorizer

    def self.muted(message)
      "\e[37m#{message}\e[0m"
    end

    def self.failed(message)
      "\e[31m#{message}\e[0m"
    end

    def self.passed(message)
      "\e[32m#{message}\e[0m"
    end

  end
end
