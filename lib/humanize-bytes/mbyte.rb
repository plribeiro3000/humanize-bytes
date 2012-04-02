module Humanize
  module Bytes
    class Mega
      def initialize(value)
        @value = value
      end

      def value
        @value
      end

      def to_b
        @value * 1024 * 1024
      end

      def to_k
        @value * 1024
      end

      def to_g
        @value / 1024.0
      end

      def to_s
        @value.instance_of?(Float) ? formatted_float + ' mega bytes' : @value.to_s + ' mega bytes'
      end

      protected

      def formatted_float
        @value.to_s[0 .. @value.to_s.index('.') + 2]
      end
    end
  end
end