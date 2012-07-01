# encoding: UTF-8
require 'spec_helper'

require 'board'
require 'article'

describe Board do
  def board
    @board ||= Board.new
  end

  describe "#url" do
    it "should return url of board if url attribute is exist" do
      board.url = "http://www.github.com/"
      board.url.should == "http://www.github.com/"
    end

    it "should return blank string if url attribute isn't exist" do
      board.url.should == ""
    end
  end

  describe "#add_article" do
    it "should add article of board" do
      expect do
        article = Article.new({
          title: "First Article",
          author: "John Doe",
          released_at: "2012.6.15"
        })
        board.add_article(article)
      end.to change{ board.articles.count }.from(0).to(1)
    end
  end
end

