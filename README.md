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

[![circleci](https://img.shields.io/circleci/project/github/ksylvest/specifier.svg)](https://circleci.com/gh/ksylvest/specifier)
[![gemnasium](https://img.shields.io/gemnasium/ksylvest/specifier.svg)](https://gemnasium.com/ksylvest/specifier)
[![coveralls](https://img.shields.io/coveralls/ksylvest/specifier.svg)](https://coveralls.io/r/ksylvest/specifier)
[![codeclimate](https://img.shields.io/codeclimate/github/ksylvest/specifier.svg)](https://codeclimate.com/github/ksylvest/specifier)

## Copyright

Copyright (c) 2016 - 2018 Kevin Sylvestre. See LICENSE for details.
