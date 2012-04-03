require "humanize-bytes/version"

module Humanize
  module Bytes
    autoload :Byte, 'humanize-bytes/byte'
    autoload :Kilo, 'humanize-bytes/kbyte'
    autoload :Mega, 'humanize-bytes/mbyte'
    autoload :Giga, 'humanize-bytes/gbyte'

    def self.initialize(value, unit = :b)
      case unit
        when 'b' then Humanize::Bytes::Byte.new(value)
        when 'k' then Humanize::Bytes::Kilo.new(value)
        when 'm' then Humanize::Bytes::Mega.new(value)
        when 'g' then Humanize::Bytes::Giga.new(value)
        when :b then Humanize::Bytes::Byte.new(value)
        when :k then Humanize::Bytes::Kilo.new(value)
        when :m then Humanize::Bytes::Mega.new(value)
        when :g then Humanize::Bytes::Giga.new(value)
        else nil
      end
    end
  end
end