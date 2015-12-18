module Humanize
  class Exa < Bytes
    def to_b
      Byte.new @value * 1024 * 1024 * 1024 * 1024 * 1024 * 1024
    end

    def to_k
      Kilo.new @value * 1024 * 1024 * 1024 * 1024 * 1024
    end

    def to_m
      Mega.new @value * 1024 * 1024 * 1024 * 1024
    end

    def to_g
      Giga.new @value * 1024 * 1024 * 1024
    end

    def to_t
      Tera.new @value * 1024 * 1024
    end

    def to_p
      Peta.new @value * 1024
    end

    def to_e
      self
    end

    def to_z
      Zetta.new @value / 1024.0
    end

    def to_y
      Yotta.new @value / 1024.0 / 1024.0
    end
  end
end
