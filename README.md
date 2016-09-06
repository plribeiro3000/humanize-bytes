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
b = Humanize::Byte.new(1024)
# convert the Byte to a Kilobyte
b.to_k
# convert the Byte to a Megabyte
b.to_m
# and so on... See Conversion table below
```

If you want to simply get a Humanized string for a set of bytes, you can
use `to_human_s`

```ruby
b = Humanize::Byte.new(1024)
b.to_human_s
# => "1.00 KB"
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
