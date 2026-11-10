require "spec_helper"

describe Specifier::Logger do
  subject(:logger) { described_class.new(stream) }

  let(:stream) { instance_spy(IO) }

  describe "#log" do
    it "proxies to stream" do
      logger.log("Hello!")
      expect(stream).to have_received(:puts).with("Hello!")
    end
  end

  describe "#<<" do
    it "proxies to stream" do
      logger << "Hello!"
      expect(stream).to have_received(:<<).with("Hello!")
    end
  end

end
