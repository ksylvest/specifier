require 'spec_helper'

RSpec.describe Specifier::Example do
  let(:description) { 'a sample example' }
  let(:world) { Specifier::World.new }
  subject(:example) { Specifier::Example.new(description, &proc {}) }

  describe '#run' do
    context 'with a passing example' do
      it 'evaluates the block in the context returning a pass result' do
        example = Specifier::Example.new('a passing example') do
          expect('today').to equal('today')
        end
        result = example.run(world)
        expect(result).to be_kind_of(Specifier::Example::Result)
        expect(result.status).to equal(:pass)
      end
    end

    context 'with a failing example' do
      let(:block) { expect('today').to equal('tomorrow') }

      it 'evaluates the block in the context returning a fail result' do
        example = Specifier::Example.new('a failing example') do
          expect('today').to equal('tomorrow')
        end
        result = example.run(world)
        expect(result).to be_kind_of(Specifier::Example::Result)
        expect(result.status).to equal(:fail)
      end
    end
  end
end
