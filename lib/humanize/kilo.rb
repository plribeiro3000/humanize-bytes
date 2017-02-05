module Humanize
  class Kilo < Bytes
    def label
      "KB"
    end

    def to_b
      Byte.new @value * KILO
    end

    def to_k
      self
    end

    def to_m
      Mega.new @value * (KILO / MEGA)
    end

    def to_g
      Giga.new @value * (KILO / GIGA)
    end

    def to_t
      Tera.new @value * (KILO / TERA)
    end

    def to_p
      Peta.new @value * (KILO / PETA)
    end

    def to_e
      Exa.new @value * (KILO / EXA)
    end

    def to_z
      Zetta.new @value * (KILO / ZETTA)
    end

    def to_y
      Yotta.new @value * (KILO / YOTTA)
    end
  end
end