require 'spec_helper'

RSpec.describe Specifier do
  it 'has a version number' do
    expect(Specifier::VERSION).to be_kind_of(String)
    expect(Specifier::VERSION).to match(/\A\d+\.\d+\.\d+\Z/)
  end

  describe '#specify' do
    it 'proxies to a context' do
      expect(Specifier::Context).to receive(:setup)
      Specifier.specify('a sample specification', &proc {})
    end
  end
end
