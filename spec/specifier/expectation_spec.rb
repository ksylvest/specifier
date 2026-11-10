require "spec_helper"

RSpec.describe Specifier::Expectation do
  subject(:expectation) { described_class.new("today") }

  let(:description) { "a sample example" }

  describe "#to" do
    it "raises an exception if the matcher fails" do
      expect {
        expectation.to(Specifier::Matcher::Equal.new("tomorrow"))
      }.to raise_error(Specifier::Expectation::MatcherError, 'expected "today" got "tomorrow"')
    end

    it "raises an exception if the matcher passes" do
      expect {
        expectation.to(Specifier::Matcher::Equal.new("today"))
      }.not_to raise_error
    end
  end

end
