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

You can then convert to other measurements using the Conversion Table
below

```ruby
# Convert 1024 bytes to Megabytes
mb = Humanize::Byte.new(1024).to_m
```

If your measurement is in a unit other than bytes, you can use any of
the other `Humanize` classes that best represent your measurement

```ruby
kb = Humanize::Kilo.new(1)
mb = Humanize::Mega.new(1)
gb = Humanize::Giga.new(1)
tb = Humanize::Tera.new(1)
pt = Humanize::Peta.new(1)
ex = Humanize::Exa.new(1)
zt = Humanize::Zetta.new(1)
yt = Humanize::Yotta.new(1)
```

### Displaying Measurements

You can print your measurement it its current unit by calling `to_s` on
any of the `Humanize` classes

```ruby
b = Humanize::Byte.new(1024)
b.to_s
=> "1024"
# Convert bytes to Megabytes
m = b.to_s
m.to_s
=> "0.0009765625"
```

If you are unsure what the best unit is for display of your measurement,
you can call `human` on a measurement to convert it to its largest unit
for display

```ruby
b = Humanize::Byte.new(109965117103)
b.human.to_s
=> "102.41299597825855 GB"
```

You can control the number of digits to the right of the decimal point
by passing in an optional hash with `:decimal_digits` set to the
precision you desire.

```ruby
b = Humanize::Byte.new(109965117103)
b.human.to_s(:decimal_digits => 3)
=> "102.413 GB"
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
