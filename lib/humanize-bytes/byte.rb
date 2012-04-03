module Humanize
  module Bytes
    class Byte
      def initialize(value)
        @value = value
      end

      def value
        @value
      end

      def to_b
        value
      end

      def to_k
        @value / 1024.0
      end

      def to_m
        @value / 1024.0 / 1024
      end

      def to_g
        @value / 1024.0 / 1024 / 1024
      end

      def to_s
        @value.instance_of?(Float) ? formatted_float + ' bytes' : @value.to_s + ' bytes'
      end

      protected

      def formatted_float
        @value.to_s[0 .. @value.to_s.index('.') + 2]
      end
    end
  end
end