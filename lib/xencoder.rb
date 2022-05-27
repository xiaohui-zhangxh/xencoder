require "xencoder/version"
require 'xencoder/xbase'
require 'xencoder/encoder'
require 'ruby2_keywords'

module Xencoder
  class << self
    ruby2_keywords def new(*args)
      Encoder.new(*args)
    end

    def encoder
      @encoder ||= Encoder.new(
        '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ',
        length: 6
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
