# Humanize::Bytes [![Build Status](https://secure.travis-ci.org/plribeiro3000/humanize-bytes.png)](http://travis-ci.org/plribeiro3000/humanize-bytes)

Convert Byte, KByte, MByte, GByte, TByte, PByte, EByte, ZByte and YByte into each other easy as to_b.

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

## Conversion Table

| Value | Equivalent | Call Methods |
|-------|------------|:-----------:|
| Byte | 1 Byte | to_b |
| Kilobyte | 1024 Bytes | to_k |
| Megabyte | 1024 Kilobytes | to_m |
| Gigabyte | 1024 Megabytes | to_g |
| Terabyte | 1024 Gigabytes | to_t |
| Petabyte | 1024 Terabytes | to_p |
| Exabyte | 1024 Petabytes | to_e |
| Zettabyte | 1024 Exabytes | to_z |
| Yottabyte | 1024 Zettabytes | to_y |

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
