module Humanize
  class HumanBytes < Bytes
    attr_reader :measure
    def initialize(measure)
      @measure = humanize(measure)
      @value = @measure.value
    end

    def to_s(options = {})
      @measure.to_s(options) + " #{@measure.label}"
    end

    private

    def humanize(measure)
      unless measure.kind_of?(Humanize::Bytes)
        return Humanize::Byte.new(0)
      end

      value = measure.to_b.value
      if value >= YOTTA
        return measure.to_y
      elsif value >= ZETTA
        return measure.to_z
      elsif value >= EXA
        return measure.to_e
      elsif value >= PETA
        return measure.to_p
      elsif value >= TERA
        return measure.to_t
      elsif value >= GIGA
        return measure.to_g
      elsif value >= MEGA
        return measure.to_m
      elsif value >= KILO
        return measure.to_k
      end
      measure.to_b
    end
  end
end
