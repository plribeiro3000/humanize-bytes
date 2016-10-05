module Humanize
  class Mega < Bytes
    def to_b
      Byte.new @value * MEGA
    end

    def to_k
      Kilo.new @value * (MEGA / KILO)
    end

    def to_m
      self
    end

    def to_g
      Giga.new @value * (MEGA / GIGA)
    end

    def to_t
      Tera.new @value * (MEGA / TERA)
    end

    def to_p
      Peta.new @value * (MEGA / PETA)
    end

    def to_e
      Exa.new @value * (MEGA / EXA)
    end

    def to_z
      Zetta.new @value * (MEGA / ZETTA)
    end

    def to_y
      Yotta.new @value * (MEGA / YOTTA)
    end
  end
end