# encoding: UTF-8
require 'time'
require 'ostruct'

class Article < OpenStruct
  def initialize(hash)
    hash[:released_at] = Time.parse(hash[:released_at])
    super
  end
end