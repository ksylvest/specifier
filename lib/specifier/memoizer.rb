module Specifier
  class Memoizer
    def initialize
      @resolutions = {}
    end

    def resolve(name)
      @resolutions[name] ||= yield
    end
  end
end
