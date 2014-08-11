# Humanize::Bytes [![Build Status](https://secure.travis-ci.org/plribeiro3000/humanize-bytes.png)](http://travis-ci.org/plribeiro3000/humanize-bytes)

Convert Byte, Kbyte, MByte, Gbyte into each other easy as to_b.

## Installation

Add this line to your application's Gemfile:

    gem 'humanize-bytes'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install humanize-bytes

## Usage

Initialize a New Byte Object with

```ruby
Humanize::Byte.new(1024)
```

Then call one of the methods: to_b, to_k, to_m, to_g.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
