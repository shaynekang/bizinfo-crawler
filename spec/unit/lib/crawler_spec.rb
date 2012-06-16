require 'spec_helper'
require 'crawler'
require 'board'
require 'article'
require 'rss_builder'

describe Crawler do
  def board
    @board ||= Board.new
  end

  def crawler
    @crawler ||= Crawler.new
  end

  def file(filename)
    File.open(filename, "r").map{|line| line}.join
  end

  describe "#crawl" do
    it "should crawl article list" do
      crawler.crawl(board, 'spec/fixture/venture.html')
      RSSBuilder.build(board).should == file('spec/fixture/venture.xml')
    end

    it "shouldn't crawl if file name is invalid" do
      expect do
        crawler.crawl(board, 'invalid file name')
      end.to raise_error
    end
  end
end