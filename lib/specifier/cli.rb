module Specifier
  class CLI
    BANNER = 'usage: specifier [options] [./specs]'.freeze

    def parse(items = ARGV)
      config = Slop.parse(items) do |options|
        options.banner = BANNER

        options.on '-h', '--help', 'help' do
          return help(options)
        end

        options.on '-v', '--version', 'version' do
          return version
        end
      end

      run(config)
    end

  private

    def help(options)
      Specifier.logger.log(String(options))
    end

    def version
      Specifier.logger.log(String(VERSION))
    end

    def run(options)
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
