require 'spec_helper'

describe Specifier::Logger do
  subject(:logger) { Specifier::Logger.new(stream) }
  let(:stream) { double(:stream) }

  describe '#log' do
    it 'proxies to stream' do
      expect(stream).to receive(:puts).with('Hello!')
      logger.log('Hello!')
    end
  end

  describe '#<<' do
    it 'proxies to stream' do
      expect(stream).to receive(:<<).with('Hello!')
      logger << 'Hello!'
    end
  end

end
