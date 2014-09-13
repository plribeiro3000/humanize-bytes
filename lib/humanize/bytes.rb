module Humanize
  class Bytes
    VERSION = '2.0.1'

    def initialize(value)
      @value = value
    end

    def value
      @value
    end

    def to_s(options = {})
      size = options.fetch(:decimal_digits, nil)
      size ||= value.to_s.split('.').size == 1 ? 0 : value.to_s.split('.').last.size
      ("%.#{size}f" % value).to_s
    end
  end
end