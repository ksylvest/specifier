class Echo
  def self.say(message)
    message
  end
end

Specifier.specify Echo do
  describe '.say' do
    it 'says "Hello" if you say "Hello"' do
      expect(Echo.say('Hello')).to equal('Hello')
    end

    it 'says "Goodbye" if you say "Goodbye"' do
      expect(Echo.say('Goodbye')).to equal('Goodbye')
    end
  end
end
