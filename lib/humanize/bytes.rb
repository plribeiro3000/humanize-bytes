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

    def value
      @value
    end

    def label
      "Bytes"
    end
    
    def to_human_s
      h = to_human
      h.to_s(:decimal_digits => 2) + " #{h.label}"
    end

    def to_human
      if @value >= YOTTA
        return to_y
      elsif @value >= ZETTA
        return to_z
      elsif @value >= EXA
        return to_e
      elsif @value >= PETA
        return to_p
      elsif @value >= TERA
        return to_t
      elsif @value >= GIGA
        return to_g
      elsif @value >= MEGA
        return to_m
      elsif @value >= KILO
        return to_k
      end
      return self
    end

    def to_s(options = {})
      size = options.fetch(:decimal_digits, nil)
      size ||= value.to_s.split('.').size == 1 ? 0 : value.to_s.split('.').last.size
      size = 0 if value.to_s.split('.').size >= 2 and value.to_s.split('.').last.to_s == '0'
      ("%.#{size}f" % value).to_s
    end
  end
end
