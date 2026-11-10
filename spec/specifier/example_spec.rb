require "spec_helper"

RSpec.describe Specifier::Example do
  let(:world) { Specifier::World.new }

  describe "#run" do
    context "with a passing example" do
      subject(:example) do
        described_class.new("a passing example") { |world| world.expect("today").to world.equal("today") }
      end

      it "evaluates the block in the context returning a pass result" do
        expect(example.run(world)).to be_a(Specifier::Example::Result).and(have_attributes(status: :pass))
      end
    end

    context "with a failing example" do
      subject(:example) do
        described_class.new("a failing example") { |world| world.expect("today").to world.equal("tomorrow") }
      end

      it "evaluates the block in the context returning a fail result" do
        expect(example.run(world)).to be_a(Specifier::Example::Result).and(have_attributes(status: :fail))
      end
    end
  end
end
