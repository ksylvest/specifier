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

[![Travis](https://img.shields.io/travis/ksylvest/specifier.svg)](https://travis-ci.org/ksylvest/specifier)
[![Gemnasium](https://img.shields.io/gemnasium/ksylvest/specifier.svg)](https://gemnasium.com/ksylvest/specifier)
[![Coveralls](https://img.shields.io/coveralls/ksylvest/specifier.svg)](https://coveralls.io/r/ksylvest/specifier)
[![Codeclimate](https://img.shields.io/codeclimate/ksylvest/specifier.svg)](https://codeclimate.com/github/ksylvest/specifier)
