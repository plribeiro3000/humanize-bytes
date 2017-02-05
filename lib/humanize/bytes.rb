module Humanize
  class Bytes
    VERSION = '2.2.0'

    KILO = 1024.0**1
    MEGA = 1024.0**2
    GIGA = 1024.0**3
    TERA = 1024.0**4
    PETA = 1024.0**5
    EXA = 1024.0**6
    ZETTA = 1024.0**7
    YOTTA = 1024.0**8

    def initialize(value)
      @value = value.to_f
    end

    def label
      @value == 1 ? "Byte" : "Bytes"
    end

    def value
      @value
    end

    def human
      Humanize::HumanBytes.new(self)
    end

    def to_s(options = {})
      size = options.fetch(:decimal_digits, nil)
      size ||= value.to_s.split('.').size == 1 ? 0 : value.to_s.split('.').last.size
      size = 0 if value.to_s.split('.').size >= 2 and value.to_s.split('.').last.to_s == '0'
      ("%.#{size}f" % value).to_s
    end
  end
end
