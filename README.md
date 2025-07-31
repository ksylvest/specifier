# Specifier

[![LICENSE](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/ksylvest/specifier/blob/main/LICENSE)
[![RubyGems](https://img.shields.io/gem/v/specifier)](https://rubygems.org/gems/specifier)
[![GitHub](https://img.shields.io/badge/github-repo-blue.svg)](https://github.com/ksylvest/specifier)
[![CircleCI](https://img.shields.io/circleci/build/github/ksylvest/specifier)](https://circleci.com/gh/ksylvest/specifier)

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

## Copyright

Copyright (c) 2016 - 2025 [Kevin Sylvestre](https://ksylvest.com). See LICENSE for details.
