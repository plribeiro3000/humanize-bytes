module Humanize
  class Bytes
    VERSION = '2.1.0'

    def initialize(value)
      @value = value.to_f
    end

    def value
      @value
    end

    def to_s(options = {})
      size = options.fetch(:decimal_digits, nil)
      size ||= value.to_s.split('.').size == 1 ? 0 : value.to_s.split('.').last.size
      size = 0 if value.to_s.split('.').size >= 2 and value.to_s.split('.').last.to_s == '0'
      ("%.#{size}f" % value).to_s
    end
  end
end