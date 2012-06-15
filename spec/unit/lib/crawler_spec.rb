require 'spec_helper'
require 'crawler'

describe Crawler do
  def board
    @board ||= Board.new
  end

  def crawler
    @crawler ||= Crawler.new
  end

  describe "#crawl" do
    it "should crawl article list" do
      crawler.crawl(board, 'spec/fixture/list.html')
      board.articles.count.should == ARTICLE_FIXTURE.count
    end

    it "shouldn't crawl if file name is invalid" do
      expect do
        crawler.crawl(board, 'invalid file name')
      end.to raise_error
    end
  end
end