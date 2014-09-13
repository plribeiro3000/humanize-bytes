module Humanize
  class Mega < Bytes
    def to_b
      Byte.new @value * 1024 * 1024
    end

    def to_k
      Kilo.new @value * 1024
    end

    def to_m
      self
    end

    def to_g
      Giga.new @value / 1024.0
    end
  end
end