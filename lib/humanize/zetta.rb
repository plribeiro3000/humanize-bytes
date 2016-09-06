module Humanize
  class Zetta < Bytes
    def label
      "ZB"
    end

    def to_b
      Byte.new @value * 1024 * 1024 * 1024 * 1024 * 1024 * 1024 * 1024
    end

    def to_k
      Kilo.new @value * 1024 * 1024 * 1024 * 1024 * 1024 * 1024
    end

    def to_m
      Mega.new @value * 1024 * 1024 * 1024 * 1024 * 1024
    end

    def to_g
      Giga.new @value * 1024 * 1024 * 1024 * 1024
    end

    def to_t
      Tera.new @value * 1024 * 1024 * 1024
    end

    def to_p
      Peta.new @value * 1024 * 1024
    end

    def to_e
      Exa.new @value * 1024
    end

    def to_z
      self
    end

    def to_y
      Yotta.new @value / 1024.0
    end
  end
end
