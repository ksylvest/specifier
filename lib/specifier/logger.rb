module Specifier

  # A generic logger extracting output for testing. Can be accessed via the global.
  #
  # Usage:
  #
  #   Specifier.logger.log("...")
  #
  class Logger
    module Color
      BLACK  = 0
      RED    = 1
      GREEN  = 2
      YELLOW = 3
    end

    module Formatting
      DEFAULT = 0
      BOLD    = 1
      ITALIC  = 3
    end

    def initialize(stream = STDOUT)
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
