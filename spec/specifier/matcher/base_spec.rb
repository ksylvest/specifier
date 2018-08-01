require 'spec_helper'

RSpec.describe Specifier::Matcher::Base do
  subject(:matcher) { Specifier::Matcher::Base.new }

  describe '#match?' do
    it 'assigns the expected' do
      matcher.match?('something')
      expect(matcher.expected).to eql('something')
    end
  end
end
