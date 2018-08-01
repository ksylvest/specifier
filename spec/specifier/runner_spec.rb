require 'spec_helper'

describe Specifier::Runner do
  let(:path) { './spec/example_spec.rb' }
  subject(:runner) { Specifier::Runner.new(paths: [path]) }
  describe '#run' do
    it 'calls load on each path then summarizes' do
      expect(runner).to receive(:load).with(path)
      expect(Specifier.formatter).to receive(:summarize)
      runner.run
    end
  end
end
