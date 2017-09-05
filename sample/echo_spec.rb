class Echo
  def say(message)
    message
  end
end

Specifier.specify Echo do
  let(:echo) { Echo.new }
  describe '.say' do
    it 'says "Hello" if you say "Hello"' do
      expect(echo.say('Hello')).to equal('Hello')
    end
  end
end
