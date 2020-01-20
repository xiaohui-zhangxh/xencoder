require "xencoder/version"
require 'xencoder/xbase'
require 'xencoder/encoder'

module Xencoder
  class << self
    def new(*args)
      Encoder.new(*args)
    end

    def encoder
      @encoder ||= Encoder.new(
        '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ',
        length: 8,
        seed: 100
      )
    end

    def encode(num)
      encoder.encode(num)
    end

    def decode(str)
      encoder.decode(str)
    end
  end
end
