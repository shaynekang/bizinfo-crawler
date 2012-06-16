# encoding: UTF-8
require 'time'

class Article
  attr_accessor :title, :author, :link, :released_at

  def initialize(attributes)
    @title = attributes[:title]
    @author = attributes[:author]
    @link = attributes[:link]
    @released_at = Time.parse(attributes[:released_at])
  end
end