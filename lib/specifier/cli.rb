module Specifier
  # Used when interacting with the suite from the command line interface (CLI).
  #
  # Usage:
  #
  #   cli = Specifier::CLI.new
  #   cli.parse
  #
  class CLI
    BANNER = "usage: specifier [options] [./specs]".freeze

    # @param items [Array<String>]
    #
    # @return [void]
    def parse(items = ARGV)
      config = Slop.parse(items) do |options|
        options.banner = BANNER

        options.on("-h", "--help", "help") { return help(options) }
        options.on("-v", "--version", "version") { return version }

        options.string("-f", "--formatter", "formatter", default: Specifier::Formatter::DEFAULT)
      end

      run(config)
    end

  private

    # @param options [Slop::Options]
    #
    # @return [void]
    def help(options)
      Specifier.logger.log(String(options))
    end

    # @return [void]
    def version
      Specifier.logger.log(String(VERSION))
    end

    # @param options [Slop::Result]
    #
    # @return [void]
    def run(options)
      Specifier.config.formatter = options[:formatter]

      paths = Set.new
      options.arguments.each do |argument|
        Find.find(argument) do |path|
          paths << path if path.match?(/\A(.*).rb\Z/)
        end
      end
      Runner.new(paths: paths).run
    end
  end
end
