module Specifier

  # Handles load and execution of specs.
  #
  # Usage:
  #
  #   runner = Specifier::Runner.new(paths: "./spec")
  #   runner.run
  #
  class Runner
    def initialize(paths:)
      @paths = paths
    end

    def run
      @paths.each do |path|
        load path
      end

      Specifier.run
      Specifier.formatter.summarize
    end
  end
end
