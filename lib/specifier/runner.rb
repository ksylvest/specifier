module Specifier
  class Runner
    def initialize(paths:)
      @paths = paths
    end

    def run
      @paths.each do |path|
        load path
      end
      Specifier.formatter.summarize
    end
  end
end
