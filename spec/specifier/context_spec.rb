require "spec_helper"

RSpec.describe Specifier::Context do
  subject(:context) { described_class.new(description, &proc {}) }

  let(:description) { "a sample context" }

  describe "#describe" do
    it "generates a new context" do
      child = context.describe("a sample context") { nil }
      expect(child).to be_a(described_class)
    end
  end

  describe "#let" do
    it "registers a defintion" do
      definition = context.let(:sample) { "sample" }
      expect(definition).to be_a(Specifier::Definition)
    end
  end

  describe "#it" do
    it "registers an example" do
      example = context.it("a sample example") { nil }
      expect(example).to be_a(Specifier::Example)
    end
  end

  describe "#run" do
    it "runs each example and proxies to the formatter" do
      allow(Specifier.formatter).to receive(:record)
      context.it("a sample spec") { |world| world.expect("today").to world.equal("today") }
      context.run
      expect(Specifier.formatter).to have_received(:record)
    end
  end

  describe "#setup" do
    it "sets up an example with all the required defintions" do
      definition = context.let(:sample) { "sample" }
      world = Specifier::World.new
      allow(definition).to receive(:define)
      context.setup(world)
      expect(definition).to have_received(:define).with(world)
    end
  end

end
