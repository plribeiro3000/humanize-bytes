module Humanize
  class Byte < Bytes
    def to_b
      self
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

    def to_k
      Kilo.new @value / KILO
    end

    def to_m
      Mega.new @value / MEGA
    end

    def to_g
      Giga.new @value / GIGA
    end

    def to_t
      Tera.new @value / TERA
    end

    def to_p
      Peta.new @value / PETA
    end

    def to_e
      Exa.new @value / EXA
    end

    def to_z
      Zetta.new @value / ZETTA
    end

    def to_y
      Yotta.new @value / YOTTA
    end
  end
end
