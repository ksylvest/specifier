module Specifier
  module Formatter
    def self.formatters
      @formatters ||= {}
    end
  end
end

require 'specifier/formatter/base'
require 'specifier/formatter/documentation'
require 'specifier/formatter/progress'

module Specifier
  module Formatter
    DEFAULT = Progress::NAME
  end
end
