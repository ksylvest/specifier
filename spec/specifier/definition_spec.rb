require 'spec_helper'

RSpec.describe Specifier::Definition do
  let(:name) { :sample }
  let(:value) { 'sample' }
  subject(:definition) { Specifier::Definition.new(name, &proc { value }) }

  describe '#define' do
    it 'defines the block as a method on the received object' do
      object = double(:object)
      definition.define(object)
      expect(object.sample).to eql('sample')
    end
  end

end
