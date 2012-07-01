# encoding: UTF-8

class Board
  attr_accessor :url

  def url=(url)
    @url = url
  end

  def url
    @url || ""
  end

  def articles
    @articles ||= []
  end

  def add_article(article)
    articles.push(article)
  end
end