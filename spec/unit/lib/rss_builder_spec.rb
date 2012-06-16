# encoding: UTF-8
require 'spec_helper'

require 'board'
require 'article'
require 'rss_builder'

describe RSSBuilder do
  def board
    @board ||= Board.new
  end

  describe "##build" do
    it "should return rss format of board information" do
      article = Article.new({
        title: "First Article",
        author: "John Doe",
        released_at: "2012.6.15",
        link: "/jojo"
      })

      board.add_article(article)
      rss = RSSBuilder.build(board)

      feed = RSS::Parser.parse(rss)
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

