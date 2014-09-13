module Humanize
  class Byte < Bytes
    def to_b
      self
    end

    def to_k
      Kilo.new @value / 1024.0
    end

    def to_m
      Mega.new @value / 1024.0 / 1024
    end

    def to_g
      Giga.new @value / 1024.0 / 1024 / 1024
    end
  end
end