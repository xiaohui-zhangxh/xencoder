# Xencoder

[![Gem Version](https://badge.fury.io/rb/xencoder.svg)](https://badge.fury.io/rb/xencoder)

Encode number to fixed length of characters, characters can be any digits, alphabets, symbols or even Chinese

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'xencoder'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install xencoder

## Usage

```ruby
require 'xencoder'

Xencoder.encoder.length # default length of encoded string
# => 6
Xencoder.encoder.max    # the maximum value for encoding
# => 55884102751
Xencoder.encode(1)
# => "EPaPaP"
Xencoder.encode(2)
# => "HSo0u4"

Xencoder.decode('HSo0u4')
# => 2

encoder1 = Xencoder.new('0123456789abcdef', length: 4, seed: 200)
encoder1.max
# => 61439
encoder1.encode(1)
# => "1c75"
encoder1.encode(2)
# => "3ec7"

encoder2 = Xencoder.new('0123456789abcdef', length: 4, seed: 201)
encoder2.encode(1)
# => "7b5c"
encoder2.encode(2)
# => "aea6"

encoder3 = Xencoder.new('欢迎来到中国', length: 4, seed: 200)
encoder3.encode(2)
# => "来中中中"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Testing

```shell
bundle exec rspec
# or test specific range
EXTRA_TEST=100000,1000000 bundle exec rspec
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/xiaohui-zhangxh/xencoder.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
