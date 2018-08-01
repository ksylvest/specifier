require 'spec_helper'

RSpec.describe Specifier do
  it 'has a version number' do
    expect(Specifier::VERSION).to be_kind_of(String)
    expect(Specifier::VERSION).to match(/\A\d+\.\d+\.\d+\Z/)
  end

  describe '.contexts' do
  end

  describe '.specify' do
    it 'proxies to a context' do
      expect(Specifier::Context).to receive(:setup)
      Specifier.specify('a sample specification', &proc {})
    end
  end

  describe '.run' do
    it 'executes run on each context' do
      context = double(:context)
      expect(Specifier).to receive(:contexts) { [context] }
      expect(context).to receive(:run)
      Specifier.run
    end
  end

  describe '.config' do
    it 'is a config' do
      expect(Specifier.config).to be_kind_of(Specifier::Config)
    end
  end

  describe '.logger' do
    it 'is a logger' do
      expect(Specifier.logger).to be_kind_of(Specifier::Logger)
    end
  end

  describe '.formatter' do
    it 'is a formatter' do
      expect(Specifier.formatter).to be_kind_of(Specifier::Formatter::Base)
    end
  end

end
