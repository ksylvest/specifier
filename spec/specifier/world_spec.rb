require "spec_helper"

RSpec.describe Specifier::World do
  subject(:world) { described_class.new }

  describe "#expect" do
    it "wraps a value in an expectation" do
      expectation = world.expect("something")
      expect(expectation).to be_a(Specifier::Expectation)
    end
  end

  describe "#equal" do
    it "wraps a value in an equal matcher" do
      expectation = world.equal("something")
      expect(expectation).to be_a(Specifier::Matcher::Equal)
    end
  end

end
