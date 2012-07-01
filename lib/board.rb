# encoding: UTF-8

class Board
  attr_accessor :url

  def articles
    @articles ||= []
  end

  def add_article(article)
    articles.push(article)
  end
end