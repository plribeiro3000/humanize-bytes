module Humanize
  class Giga < Bytes
    def label
      "GB"
    end
    
    def to_b
      Byte.new @value * GIGA
    end

    def to_k
      Kilo.new @value * (GIGA / KILO)
    end

    def to_m
      Mega.new @value * (GIGA / MEGA)
    end

    def to_g
      self
    end

    def to_t
      Tera.new @value * (GIGA / TERA)
    end

    def to_p
      Peta.new @value * (GIGA / PETA)
    end

    def to_e
      Exa.new @value * (GIGA / EXA)
    end

    def to_z
      Zetta.new @value * (GIGA / ZETTA)
    end

    def to_y
      Yotta.new @value * (GIGA / YOTTA)
    end
  end
end
