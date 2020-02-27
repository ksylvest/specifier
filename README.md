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
[![CodeClimate (Maintainability)](https://api.codeclimate.com/v1/badges/391d09bf5fb4a6be19e2/maintainability)](https://codeclimate.com/github/ksylvest/specifier/maintainability)
[![CodeClimate (Test Coverage)](https://api.codeclimate.com/v1/badges/391d09bf5fb4a6be19e2/test_coverage)](https://codeclimate.com/github/ksylvest/specifier/test_coverage)



## Copyright

Copyright (c) 2016 - 2020 [Kevin Sylvestre](https://ksylvest.com). See LICENSE for details.
