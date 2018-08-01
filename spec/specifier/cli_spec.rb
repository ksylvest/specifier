require 'spec_helper'

describe Specifier::CLI do
  subject(:cli) { Specifier::CLI.new }
  let(:runner) { double(:runner) }

  describe '#parse' do
    %w[-v --version].each do |option|
      it "supports '#{option}' option" do
        expect(Specifier.logger).to receive(:log).with Specifier::VERSION
        cli.parse([option])
      end
    end

    %w[-h --help].each do |option|
      it "supports '#{option}'" do
        expect(Specifier.logger).to receive(:log).with <<~DEBUG
          usage: specifier [options] [./specs]
              -h, --help       help
              -v, --version    version
              -f, --formatter  formatter
        DEBUG
        cli.parse([option])
      end
    end

    it 'builds a launcher and executes run' do
      expect(Specifier::Runner).to receive(:new) { runner }
      expect(runner).to receive(:run)
      cli.parse(%w[./sample])
    end
  end

end
