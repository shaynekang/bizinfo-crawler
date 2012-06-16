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

  describe "#to_rss" do
    it "should return rss format of board info" do
      board.add_article(title: "First Article", author: "John Doe", released_at: "2012.6.15", link: "/jojo")
      feed = RSS::Parser.parse(board.to_rss)
      feed.channel.title.should == "비즈인포 창업/벤처 RSS"
      feed.channel.description.should == "비즈인포 창업/벤처 게시판의 RSS리스트입니다."
      feed.items.count.should == 1
      feed.items.each do |item|
        item.title.should == "[John Doe]First Article"
        item.link.should == "http://www.bizinfo.go.kr/jojo"
        item.date.should == Time.parse("2012.6.15")
      end
    end
  end
end

