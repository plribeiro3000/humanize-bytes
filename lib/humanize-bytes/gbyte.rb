module Humanize
  module Bytes
    class Giga
      def initialize(value)
        @value = value
      end

      def value
        @value
      end

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

      def to_s
        @value.instance_of?(Float) ? formatted_float + ' giga bytes' : @value.to_s + ' giga bytes'
      end

      protected

      def formatted_float
        @value.to_s[0 .. @value.to_s.index('.') + 2]
      end
    end
  end
end