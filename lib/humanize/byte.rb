module Humanize
  class Byte < Bytes
    def to_b
      self
    end
    
    def label
      @value == 1 ? "Byte" : "Bytes"
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
