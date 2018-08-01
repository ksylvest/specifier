require 'spec_helper'

RSpec.describe Specifier::Colorizer do

  describe '.muted' do
    it 'colorizes as muted' do
      expect(Specifier::Colorizer.muted('sample')).to eql("\e[37msample\e[0m")
    end
  end

  describe '.passed' do
    it 'colorizes as passed' do
      expect(Specifier::Colorizer.passed('sample')).to eql("\e[32msample\e[0m")
    end
  end

  describe '.failed' do
    it 'colorizes as failed' do
      expect(Specifier::Colorizer.failed('sample')).to eql("\e[31msample\e[0m")
    end
  end

end
