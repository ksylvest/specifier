require 'spec_helper'

describe Specifier::Formatter::Documentation do
  subject(:formatter) { Specifier::Formatter::Documentation.new(logger) }
  let(:logger) { double(:logger) }
  let(:context) { double(:context, description: 'a sample context') }
  let(:example) { double(:example, description: 'a sample example') }
  let(:message) { 'an unknown error occurred' }

  describe '#record' do
    it 'sends a "a sample example" to the logger for a pass' do
      expect(logger).to receive(:log).with(Specifier::Colorizer.passed('[PASS] a sample example'))
      formatter.record(example, double(:result, status: :pass))
    end

    it 'sends a "a sample example" to the logger for a fail' do
      expect(logger).to receive(:log).with(Specifier::Colorizer.failed('[FAIL] a sample example'))
      formatter.record(example, double(:result, status: :fail))
    end
  end

  describe '#context' do
    it 'sends a "a sample context" to the logger' do
      expect(logger).to receive(:log).with(context.description)
      formatter.context(context) {}
    end
  end

end
