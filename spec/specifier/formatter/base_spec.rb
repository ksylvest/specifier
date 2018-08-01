require 'spec_helper'

describe Specifier::Formatter::Base do
  subject(:formatter) { Specifier::Formatter::Base.new(logger) }
  let(:logger) { double(:logger) }
  let(:example) { double(:example) }
  let(:message) { 'an unknown error occurred' }

  describe '#summarize' do
    it 'sends the summary to the logger' do
      2.times { formatter.record(example, double(:result, status: :pass)) }
      3.times { formatter.record(example, double(:result, status: :fail)) }
      summary = <<~SUMMARY
        Total: #{Specifier::Colorizer.muted(5)}
        Passed: #{Specifier::Colorizer.passed(2)}
        Failed: #{Specifier::Colorizer.failed(3)}
      SUMMARY
      allow(logger).to receive(:<<)
      expect(logger).to receive(:log)
      expect(logger).to receive(:log).with(summary)
      formatter.summarize
    end
  end

end
