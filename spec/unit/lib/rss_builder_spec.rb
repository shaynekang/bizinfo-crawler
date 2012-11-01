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
      board.url = "http://www.bizinfo.go.kr"

      article = Article.new({
        title: "First Article",
        description: "This is the first article. Yeah~",
        author: "John Doe",
        released_at: "2012.6.15",
        link: "/jojo"
      })

      board.add_article(article)
      rss = RSSBuilder.build(board)

      feed = RSS::Parser.parse(rss)
      feed.channel.title.should == "Bizinfo's venture and finantial RSS"
      feed.channel.description.should == "Rss of Bizinfo's venture and finantial forum."
      feed.items.count.should == 1
      feed.items.each do |item|
        item.title.should == "[John Doe]First Article"
        item.description.should == "This is the first article. Yeah~"
        item.link.should == "http://www.bizinfo.go.kr/jojo"
        item.date.should == Time.parse("2012.6.15")
      end
    end
  end
end

