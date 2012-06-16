# encoding: UTF-8

class Board
  def articles
    @articles ||= []
  end

  def add_article(article)
    articles.push(article)
  end
end