module Humanize
  class Tera < Bytes
    def to_b
      Byte.new @value * TERA
    end

    def to_k
      Kilo.new @value * (TERA / KILO)
    end

    def to_m
      Mega.new @value * (TERA / MEGA)
    end

    def to_g
      Giga.new @value * (TERA / GIGA)
    end

    def to_t
      self
    end

    def to_p
      Peta.new @value * (TERA / PETA)
    end

    def to_e
      Exa.new @value * (TERA / EXA)
    end

    def to_z
      Zetta.new @value * (TERA / ZETTA)
    end

    def to_y
      Yotta.new @value * (TERA / YOTTA)
    end
  end
end
