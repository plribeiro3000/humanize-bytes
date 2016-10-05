module Humanize
  class Zetta < Bytes
    def to_b
      Byte.new @value * ZETTA
    end

    def to_k
      Kilo.new @value * (ZETTA / KILO)
    end

    def to_m
      Mega.new @value * (ZETTA / MEGA)
    end

    def to_g
      Giga.new @value * (ZETTA / GIGA)
    end

    def to_t
      Tera.new @value * (ZETTA / TERA)
    end

    def to_p
      Peta.new @value * (ZETTA / PETA)
    end

    def to_e
      Exa.new @value * (ZETTA / EXA)
    end

    def to_z
      self
    end

    def to_y
      Yotta.new @value * (ZETTA / YOTTA)
    end
  end
end
