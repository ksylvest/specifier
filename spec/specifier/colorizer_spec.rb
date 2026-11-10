require "spec_helper"

RSpec.describe Specifier::Colorizer do

  describe ".muted" do
    it "colorizes as muted" do
      expect(described_class.muted("sample")).to eql("\e[37msample\e[0m")
    end
  end

  describe ".passed" do
    it "colorizes as passed" do
      expect(described_class.passed("sample")).to eql("\e[32msample\e[0m")
    end
  end

  describe ".failed" do
    it "colorizes as failed" do
      expect(described_class.failed("sample")).to eql("\e[31msample\e[0m")
    end
  end

end
