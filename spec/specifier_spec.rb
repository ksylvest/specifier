require "spec_helper"

RSpec.describe Specifier do
  it "has a version number" do
    expect(Specifier::VERSION).to match(/\A\d+\.\d+\.\d+\z/)
  end

  describe ".specify" do
    it "proxies to a context" do
      allow(described_class).to receive(:contexts).and_return([])
      allow(Specifier::Context).to receive(:setup)
      described_class.specify("a sample specification", &proc {})
      expect(Specifier::Context).to have_received(:setup)
    end
  end

  describe ".run" do
    it "executes run on each context" do
      context = instance_spy(Specifier::Context)
      allow(described_class).to receive(:contexts).and_return([context])
      described_class.run
      expect(context).to have_received(:run)
    end
  end

  describe ".config" do
    it "is a config" do
      expect(described_class.config).to be_a(Specifier::Config)
    end
  end

  describe ".logger" do
    it "is a logger" do
      expect(described_class.logger).to be_a(Specifier::Logger)
    end
  end

  describe ".formatter" do
    it "is a formatter" do
      expect(described_class.formatter).to be_a(Specifier::Formatter::Base)
    end
  end

end
