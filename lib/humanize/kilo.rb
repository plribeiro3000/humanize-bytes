module Humanize
  class Kilo < Bytes
    def to_b
      Byte.new @value * 1024
    end

    def to_k
      self
    end

    def to_m
      Mega.new @value / 1024.0
    end

    def to_g
      Giga.new @value / 1024.0 / 1024
    end
  end
end