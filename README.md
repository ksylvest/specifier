# Specifier

## Example

```ruby
class Echo
  def self.say(message)
    message
  end
end
```

```ruby
Specifier.specify Echo do
  describe '.say' do
    it 'says "Hello" if you say "Hello"' do
      expect(Echo.say('Hello')).to equal('Hello')
    end
  end
end
```

## Usage

```bash
bundle exec specifier ./specs
```
