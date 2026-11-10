require "spec_helper"

RSpec.describe Specifier::Matcher::Equal do
  subject(:matcher) { described_class.new("today") }

  describe "#match?" do
    it "is is truthy for the actual value" do
      expect(matcher).to(satisfy { |m| m.match?("today") })
    end

    it "is is falsey for a random value" do
      expect(matcher).not_to(satisfy { |m| m.match?("tomorrow") })
    end
  end

  describe "#message" do
    it "proxies the expected and actual values" do
      matcher.expected = "tomorrow"
      expect(matcher.message).to eql('expected "tomorrow" got "today"')
    end
  end
end
