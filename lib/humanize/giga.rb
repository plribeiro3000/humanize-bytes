module Humanize
  class Giga < Bytes
    def to_b
      Byte.new @value * 1024 * 1024 * 1024
    end

    def to_k
      Kilo.new @value * 1024 * 1024
    end

    def to_m
      Mega.new @value * 1024
    end

    def to_g
      self
    end
  end
end