module Humanize
  class Bytes
    VERSION = '2.3.1'
    BASE_MEASURE = 1024.0
    KILO = BASE_MEASURE
    MEGA = KILO * BASE_MEASURE
    GIGA = MEGA * BASE_MEASURE
    TERA = GIGA * BASE_MEASURE
    PETA = TERA * BASE_MEASURE
    EXA = PETA * BASE_MEASURE
    ZETTA = EXA * BASE_MEASURE
    YOTTA = ZETTA * BASE_MEASURE

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
