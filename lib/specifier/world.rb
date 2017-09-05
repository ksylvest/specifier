module Specifier

  # Defines a world for a specification to execute within.
  #
  # Usage:
  #
  #   world = Specifier::World.new
  #   world.expect('today').to equal('tomorrow')
  #
  class World

    def expect(value)
      Expectation.new(value)
    end

    def equal(value)
      Matcher::Equal.new(value)
    end

  end
end
