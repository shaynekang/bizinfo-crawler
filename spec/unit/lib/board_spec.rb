# encoding: UTF-8
require 'spec_helper'
require 'board'

describe Board do
  def board
    @board ||= Board.new
  end

  describe "#add_article" do
    it "should add article of board" do
      expect do
        board.add_article(title: "First Article", author: "John Doe", released_at: "2012.6.15")
      end.to change{ board.articles.count }.from(0).to(1)
    end
  end
end

