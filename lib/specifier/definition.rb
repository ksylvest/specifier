module Specifier

  # Configures a definition (used for let statements).
  #
  # Usage:
  #
  #   definition = Specifier::Definition.new("...") do
  #     # ...
  #   end
  #
  #   definition.define(object)
  #
  class Definition

    def initialize(name, &block)
      @name = name
      @memoizer = Memoizer.new(&block)
    end

    def define(object)
      memoizer = @memoizer
      object.define_singleton_method(@name) do
        memoizer.evaluate
      end
    end

  end
end
