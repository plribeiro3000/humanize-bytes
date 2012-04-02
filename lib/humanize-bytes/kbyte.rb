module Humanize
  module Bytes
    class Kilo
      def initialize(value)
        @value = value
      end

      def value
        @value
      end

      def to_b
        @value * 1024
      end

      def to_m
        @value / 1024.0
      end

      def to_g
        @value / 1024.0 / 1024
      end

      def to_s
        @value.instance_of?(Float) ? formatted_float + ' kilo bytes' : @value.to_s + ' kilo bytes'
      end

      protected

      def formatted_float
        @value.to_s[0 .. @value.to_s.index('.') + 2]
      end
    end
  end
end