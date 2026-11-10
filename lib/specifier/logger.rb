module Specifier
  # A generic logger extracting output for testing. Can be accessed via the global.
  #
  # Usage:
  #
  #   Specifier.logger.log("...")
  #
  class Logger
    # @param stream [IO]
    def initialize(stream = $stdout)
      @stream = stream
    end

    # @param message [String]
    #
    # @return [void]
    def <<(message)
      @stream << message
    end

    # @param message [String, nil]
    #
    # @return [void]
    def log(message = nil)
      @stream.puts message
    end
  end
end
