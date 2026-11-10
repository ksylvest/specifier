require "spec_helper"

describe Specifier::Formatter::Documentation do
  subject(:formatter) { described_class.new(logger) }

  let(:logger) { instance_spy(Specifier::Logger) }
  let(:context) { instance_double(Specifier::Context, description: "a sample context") }
  let(:example) { instance_double(Specifier::Example, description: "a sample example") }

  describe "#record" do
    it 'sends a "a sample example" to the logger for a pass' do
      formatter.record(example, Specifier::Example::Result.new(:pass))
      expect(logger).to have_received(:log).with(Specifier::Colorizer.passed("[PASS] a sample example"))
    end

    it 'sends a "a sample example" to the logger for a fail' do
      formatter.record(example, Specifier::Example::Result.new(:fail))
      expect(logger).to have_received(:log).with(Specifier::Colorizer.failed("[FAIL] a sample example"))
    end
  end

  describe "#context" do
    it 'sends a "a sample context" to the logger' do
      formatter.context(context) { nil }
      expect(logger).to have_received(:log).with(context.description)
    end
  end

end
