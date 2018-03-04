# Specifier

## Installation

```bash
gem install specifier
```

## Example

```ruby
class Echo
  def say(message)
    message
  end
end
```

```ruby
Specifier.specify Echo do
  let(:echo) { Echo.new }

  describe '#say' do
    it 'says "Hello" if you say "Hello"' do
      expect(echo.say('Hello')).to equal('Hello')
    end
  end
end
```

## Usage

```bash
bundle exec specifier ./specs
```

## Status

[![CircleCI](https://circleci.com/gh/ksylvest/specifier.svg?style=svg)](https://circleci.com/gh/ksylvest/specifier)

[![CodeClimate](https://api.codeclimate.com/v1/badges/391d09bf5fb4a6be19e2/maintainability)](https://codeclimate.com/github/ksylvest/specifier/maintainability)
[![CodeClimate](https://api.codeclimate.com/v1/badges/391d09bf5fb4a6be19e2/test_coverage)](https://codeclimate.com/github/ksylvest/specifier/test_coverage)

[![Gemnasium](https://gemnasium.com/badges/github.com/ksylvest/specifier.svg)](https://gemnasium.com/github.com/ksylvest/specifier)



## Copyright

Copyright (c) 2016 - 2018 Kevin Sylvestre. See LICENSE for details.
