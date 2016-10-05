module Humanize
  class Yotta < Bytes
    def to_b
      Byte.new @value * YOTTA
    end

    def to_k
      Kilo.new @value * (YOTTA / KILO)
    end

    def to_m
      Mega.new @value * (YOTTA / MEGA)
    end

    def to_g
      Giga.new @value * (YOTTA / GIGA)
    end

    def to_t
      Tera.new @value * (YOTTA / TERA)
    end

    def to_p
      Peta.new @value * (YOTTA / PETA)
    end

    def to_e
      Exa.new @value * (YOTTA / EXA)
    end

    def to_z
      Zetta.new @value * (YOTTA / ZETTA)
    end

    def to_y
      self
    end
  end
end
