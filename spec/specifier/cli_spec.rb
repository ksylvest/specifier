require "spec_helper"

describe Specifier::CLI do
  subject(:cli) { described_class.new }

  let(:runner) { instance_spy(Specifier::Runner) }

  describe "#parse" do
    %w[-v --version].each do |option|
      it "supports '#{option}' option" do
        allow(Specifier.logger).to receive(:log)
        cli.parse([option])
        expect(Specifier.logger).to have_received(:log).with(Specifier::VERSION)
      end
    end

    %w[-h --help].each do |option|
      let(:help) do
        <<~HELP
          usage: specifier [options] [./specs]
              -h, --help       help
              -v, --version    version
              -f, --formatter  formatter
        HELP
      end

      it "supports '#{option}'" do
        allow(Specifier.logger).to receive(:log)
        cli.parse([option])
        expect(Specifier.logger).to have_received(:log).with(help)
      end
    end

    it "builds a launcher and executes run" do
      allow(Specifier::Runner).to receive(:new).and_return(runner)
      cli.parse(%w[./sample])
      expect(runner).to have_received(:run)
    end
  end

end
