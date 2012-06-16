require 'spec_helper'
require 'crawler'

describe Crawler do
  def board
    @board ||= Board.new
  end

  def crawler
    @crawler ||= Crawler.new
  end

  def file(filename)
    data = ""
    File.open(filename, "r").each_line {|line| data += line}
    data
  end

  describe "#crawl" do
    it "should crawl article list" do
      crawler.crawl(board, 'spec/fixture/venture.html')
      board.to_rss.should == file('spec/fixture/venture.xml')
    end

    it "shouldn't crawl if file name is invalid" do
      expect do
        crawler.crawl(board, 'invalid file name')
      end.to raise_error
    end
  end
end