module Humanize
  class Exa < Bytes
    def to_b
      Byte.new @value * EXA
    end

    def to_k
      Kilo.new @value * (EXA / KILO)
    end

    def to_m
      Mega.new @value * (EXA / MEGA)
    end

    def to_g
      Giga.new @value * (EXA / GIGA)
    end

    def to_t
      Tera.new @value * (EXA / TERA)
    end

    def to_p
      Peta.new @value * (EXA / PETA)
    end

    def to_e
      self
    end

    def to_z
      Zetta.new @value * (EXA / ZETTA)
    end

    def to_y
      Yotta.new @value * (EXA / YOTTA)
    end
  end
end
