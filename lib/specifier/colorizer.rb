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

    # @param message [String]
    #
    # @return [String]
    def self.muted(message)
      "\e[37m#{message}\e[0m"
    end

    # @param message [String]
    #
    # @return [String]
    def self.failed(message)
      "\e[31m#{message}\e[0m"
    end

    # @param message [String]
    #
    # @return [String]
    def self.passed(message)
      "\e[32m#{message}\e[0m"
    end
  end
end
