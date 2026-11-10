module Specifier
  module Formatter
    DEFAULT = Progress::NAME

    # @return [Hash{String => Class<Specifier::Formatter::Base>}]
    def self.formatters
      @formatters ||= {
        Documentation::NAME => Documentation,
        Progress::NAME => Progress,
      }
    end
  end
end
