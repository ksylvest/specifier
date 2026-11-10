require "spec_helper"

RSpec.describe Specifier::Definition do
  subject(:definition) { described_class.new(name, &proc { value }) }

  let(:name) { :sample }
  let(:value) { "sample" }

  describe "#define" do
    it "defines the block as a method on the received object" do
      object = Object.new
      definition.define(object)
      expect(object.sample).to eql("sample")
    end
  end

end
