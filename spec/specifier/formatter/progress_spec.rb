require "spec_helper"

describe Specifier::Formatter::Progress do
  subject(:formatter) { described_class.new(logger) }

  let(:logger) { instance_spy(Specifier::Logger) }
  let(:example) { instance_double(Specifier::Example) }

  describe "#record" do
    it 'sends a "+" to the logger for a pass' do
      formatter.record(example, Specifier::Example::Result.new(:pass))
      expect(logger).to have_received(:<<).with(Specifier::Colorizer.passed("+"))
    end

    it 'sends a "-" to the logger for a fail' do
      formatter.record(example, Specifier::Example::Result.new(:fail))
      expect(logger).to have_received(:<<).with(Specifier::Colorizer.failed("-"))
    end
  end
end
