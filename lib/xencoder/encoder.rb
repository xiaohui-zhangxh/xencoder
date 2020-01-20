module Xencoder
  class Encoder
    attr_reader :chars, :length, :max, :min, :seed

    def initialize(chars, length: 6, seed: 1)
      @chars = build_chars(chars).freeze
      @length = length
      @seed = seed
      @xbase = Xbase.new(@chars)
      @min = @xbase.to_i("#{chars[1]}#{chars[0] * (length - 1)}")
      @max = @xbase.to_i(chars[-1] * length) - @min
    end

    def encode(number)
      str = @xbase.to_x(number + min)
      (str.length - 1).downto(1).each do |i|
        idx = mappings.index(str[i])
        idx2 = (mappings.index(str[i - 1]) + idx) % mappings.size
        str[i] = chars.at(idx)
        str[i - 1] = chars.at(idx2)
      end
      str
    end

    def decode(str)
      str = str.dup
      0.upto(str.length - 2).each do |i|
        idx = chars.index(str[i + 1])
        idx2 = (chars.index(str[i]) - idx + chars.size) % chars.size
        str[i] = mappings.at(idx2)
        str[i + 1] = mappings.at(idx)
      end
      @xbase.to_i(str) - min
    end

    private

    def mappings
      return @mappings if defined?(@mappings)

      @mappings = rand_with(seed) { @chars.shuffle }
    end

    def rand_with(seed)
      old_seed = srand(seed)
      yield
    ensure
      srand old_seed
    end

    def build_chars(input)
      input = input.chars if input.is_a?(String)
      raise "chars must be a type of String or Array" unless input.is_a?(Array)
      raise "chars contains duplicate element" if input.uniq.size != input.size
      input.dup
    end
  end
end
