# encoding: UTF-8

class Board
  attr_accessor :articles

  def initialize
    @articles = []
  end

  def add_article(article)
    @articles.push(article)
  end
end