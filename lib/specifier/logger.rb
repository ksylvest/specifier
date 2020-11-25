module Specifier

  # A generic logger extracting output for testing. Can be accessed via the global.
  #
  # Usage:
  #
  #   Specifier.logger.log("...")
  #
  class Logger

    def initialize(stream = $stdout)
      @stream = stream
    end

    def <<(message)
      @stream << message
    end

    def log(message = nil)
      @stream.puts message
    end

  end

end
