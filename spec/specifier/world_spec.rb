require 'spec_helper'

RSpec.describe Specifier::World do
  subject(:world) { Specifier::World.new }

  describe '#expect' do
    it 'wraps a value in an expectation' do
      expectation = world.expect('something')
      expect(expectation).to be_kind_of(Specifier::Expectation)
    end
  end

  describe '#equal' do
    it 'wraps a value in an equal matcher' do
      expectation = world.equal('something')
      expect(expectation).to be_kind_of(Specifier::Matcher::Equal)
    end
  end

end
