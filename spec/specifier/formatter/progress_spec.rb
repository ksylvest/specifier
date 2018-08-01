require 'spec_helper'

describe Specifier::Formatter::Progress do
  subject(:formatter) { Specifier::Formatter::Progress.new(logger) }
  let(:logger) { double(:logger) }
  let(:example) { double(:example) }
  let(:message) { 'an unknown error occurred' }

  describe '#record' do
    it 'sends a "+" to the logger for a pass' do
      expect(logger).to receive(:<<).with(Specifier::Colorizer.passed('+'))
      formatter.record(example, double(:result, status: :pass))
    end

    it 'sends a "-" to the logger for a fail' do
      expect(logger).to receive(:<<).with(Specifier::Colorizer.failed('-'))
      formatter.record(example, double(:result, status: :fail))
    end
  end
end
