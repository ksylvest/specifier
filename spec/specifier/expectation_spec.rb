require 'spec_helper'

RSpec.describe Specifier::Expectation do
  let(:description) { 'a sample example' }
  subject(:expectation) { Specifier::Expectation.new('today') }

  describe '#to' do
    it 'raises an exception if the matcher fails' do
      expect {
        expectation.to(Specifier::Matcher::Equal.new('tomorrow'))
      }.to raise_error(Specifier::Expectation::MatcherError, 'expected "today" got "tomorrow"')
    end

    it 'raises an exception if the matcher passes' do
      expect {
        expectation.to(Specifier::Matcher::Equal.new('today'))
      }.to_not raise_error
    end
  end

end
