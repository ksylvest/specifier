require "spec_helper"

describe Specifier::Formatter::Base do
  subject(:formatter) { described_class.new(logger) }

  let(:logger) { instance_spy(Specifier::Logger) }
  let(:example) { instance_double(Specifier::Example) }
  let(:summary) do
    <<~SUMMARY
      Total: #{Specifier::Colorizer.muted(5)}
      Passed: #{Specifier::Colorizer.passed(2)}
      Failed: #{Specifier::Colorizer.failed(3)}
    SUMMARY
  end

  describe "#summarize" do
    before do
      2.times { formatter.record(example, Specifier::Example::Result.new(:pass)) }
      3.times { formatter.record(example, Specifier::Example::Result.new(:fail)) }
    end

    it "sends the summary to the logger" do
      formatter.summarize
      expect(logger).to have_received(:log).with(summary)
    end
  end

end
