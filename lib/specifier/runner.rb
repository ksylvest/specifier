module Specifier
  # Handles load and execution of specs.
  #
  # Usage:
  #
  #   runner = Specifier::Runner.new(paths: "./spec")
  #   runner.run
  #
  class Runner
    # @param paths [Enumerable<String>]
    def initialize(paths:)
      @paths = paths
    end

    # @return [void]
    def run
      @paths.each do |path|
        load path
      end

      Specifier.run
      Specifier.formatter.summarize
    end
  end
end
