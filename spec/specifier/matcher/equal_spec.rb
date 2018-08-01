require 'spec_helper'

RSpec.describe Specifier::Matcher::Equal do
  subject(:matcher) { Specifier::Matcher::Equal.new('today') }

  describe '#match?' do
    it 'is is truthy for the actual value' do
      expect(matcher.match?('today')).to be_truthy
    end

    it 'is is falsey for a random value' do
      expect(matcher.match?('tomorrow')).to be_falsey
    end
  end

  describe '#message' do
    it 'proxies the expected and actual values' do
      matcher.expected = 'tomorrow'
      expect(matcher.message).to eql('expected "tomorrow" got "today"')
    end
  end
end
