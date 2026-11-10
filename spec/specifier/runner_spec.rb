require "spec_helper"
require "tempfile"

describe Specifier::Runner do
  subject(:runner) { described_class.new(paths: [file.path]) }

  let(:file) do
    Tempfile.new(%w[example _spec.rb]).tap do |file|
      file.write('Specifier.logger.log("loaded")')
      file.flush
    end
  end

  after { file.close! }

  describe "#run" do
    it "loads each path" do
      allow(Specifier.logger).to receive(:log)
      runner.run
      expect(Specifier.logger).to have_received(:log).with("loaded")
    end

    it "summarizes" do
      allow(Specifier.logger).to receive(:log)
      allow(Specifier.formatter).to receive(:summarize)
      runner.run
      expect(Specifier.formatter).to have_received(:summarize)
    end
  end
end
