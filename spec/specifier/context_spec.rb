require 'spec_helper'

RSpec.describe Specifier::Context do
  let(:descriptor) { 'a sample context' }
  subject(:context) { Specifier::Context.new(descriptor, &proc {}) }

  describe '#describe' do
    it 'generates a new context' do
      child = context.describe 'a sample context' do
      end
      expect(child).to be_kind_of(Specifier::Context)
    end
  end

  describe '#it' do
    it 'registers an example' do
      example = context.it 'a sample example' do
      end
      expect(example).to be_kind_of(Specifier::Example)
    end
  end

  describe '#run' do
    it 'runs each example and proxies to the formatter' do
      context.it 'a sample spec' do
        expect('today').to equal('today')
      end
      expect(Specifier.formatter).to receive(:record)
      context.run
    end
  end

end
