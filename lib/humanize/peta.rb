module Humanize
  class Peta < Bytes
    def to_b
      Byte.new @value * PETA
    end

    def to_k
      Kilo.new @value * (PETA / KILO)
    end

    def to_m
      Mega.new @value * (PETA / MEGA)
    end

    def to_g
      Giga.new @value * (PETA / GIGA)
    end

    def to_t
      Tera.new @value * (PETA / TERA)
    end

    def to_p
      self
    end

    def to_e
      Exa.new @value * (PETA / EXA)
    end

    def to_z
      Zetta.new @value * (PETA / ZETTA)
    end

    def to_y
      Yotta.new @value * (PETA / YOTTA)
    end
  end
end
