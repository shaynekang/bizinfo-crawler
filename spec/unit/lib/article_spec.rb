# encoding: UTF-8
require 'spec_helper'

require 'article'

describe Article do
  it "should create a new instance" do
    article = Article.new({
      title: "First Article",
      description: "This is the first article. Yeah~",
      author: "John Doe",
      released_at: "2012.6.15",
      link: "/jojo"
    })

    article.title.should == "First Article"
    article.description.should == "This is the first article. Yeah~"
    article.author.should == "John Doe"
    article.link.should == "/jojo"
    article.released_at.should == Time.parse("2012.6.15")
  end
end