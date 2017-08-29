require 'spec_helper'

describe Specifier::Formatter::Base do
  subject(:formatter) { Specifier::Formatter::Base.new(logger) }
  let(:logger) { double(:logger) }
  let(:example) { double(:example) }
  let(:message) { 'an unknown error occurred' }

  describe '#passed' do
    it 'filters the results to "pass"' do
      expect {
        formatter.record(example, double(:result, status: :pass))
      }.to change { formatter.passed.count }
      result, = formatter.passed
      expect(result).to be_kind_of(Specifier::Formatter::Base::Recording)
      expect(result.example).to eql(example)
    end
  end

  describe '#failed' do
    it 'filters the results to "fail"' do
      expect {
        formatter.record(example, double(:result, status: :fail))
      }.to change { formatter.failed.count }
      result, = formatter.failed
      expect(result).to be_kind_of(Specifier::Formatter::Base::Recording)
      expect(result.example).to eql(example)
    end
  end

  describe '#summary' do
    it 'sends the summary to the logger' do
      2.times { formatter.record(example, double(:result, status: :pass)) }
      3.times { formatter.record(example, double(:result, status: :fail)) }
      summary = <<~SUMMARY
        Total: 5
        Passed: 2
        Failed: 3
      SUMMARY
      allow(logger).to receive(:<<)
      expect(logger).to receive(:log)
      expect(logger).to receive(:log).with(summary)
      formatter.summarize
    end
  end

  describe '#summarize' do
    it 'summarizes the passes and failures' do
      allow(logger).to receive(:<<)
      2.times { formatter.record(example, double(:result, status: :pass)) }
      3.times { formatter.record(example, double(:result, status: :fail)) }
      summary = <<~SUMMARY
        Total: 5
        Passed: 2
        Failed: 3
      SUMMARY
      expect(formatter.summary).to eql(summary)
    end
  end

end
