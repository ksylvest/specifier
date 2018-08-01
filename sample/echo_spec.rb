class Echo
  def say(message)
    message
  end
end

Specifier.specify Echo do
  describe '#say' do
    it 'says "Hello" if you say "Hello"' do
      expect(Echo.new.say('Hello')).to equal('Hello')
    end

    it 'says "Goodbye" if you say "Goodbye"' do
      expect(Echo.new.say('Goodbye')).to equal('Goodbye')
    end

    it 'says "Hello" if you say "Goodbye"' do
      expect(Echo.new.say('Hello')).to equal('Goodbye')
    end

    it 'fails graceful for syntax errors' do
      echo.greet('Sample')
    end
  end
end
