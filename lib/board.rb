# encoding: UTF-8
require 'nokogiri'
require 'open-uri'
require 'rss/maker'

class Board
  attr_accessor :articles

  def initialize
    @articles = []
  end

  def add_article(article)
    @articles.push(article)
  end

  RSS_VERSION = "2.0"
  def to_rss
    RSS::Maker.make(RSS_VERSION) do |maker|
      maker.channel.title = "비즈인포 창업/벤처 RSS"
      maker.channel.link = "http://www.bizinfo.go.kr/userPolicyInfoList.do?policyInfoSerchTO.lclasId=5000"
      maker.channel.description = "비즈인포 창업/벤처 게시판의 RSS리스트입니다."
      maker.items.do_sort = true
      @articles.each do |article|
        maker.items.new_item do |item|
          item.title = "[#{article[:author]}]#{article[:title]}"
          item.link = "http://www.bizinfo.go.kr#{article[:link]}"
#          item.updated = Date.parse(article[:released_at])
        end
      end
    end.to_s
  end

  def save_xml(filename)
    builder = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
      xml.articles do
        @articles.each do |article|
          xml.article do
            xml.title article[:title]
            xml.author article[:author]
            xml.released_at article[:released_at]
          end
        end
      end
    end
    File.open(filename, 'w') {|f| f.write(builder.to_xml) }
  end

  def load_xml(filename)
    @doc = Nokogiri::XML(open(filename), nil, 'UTF-8')
    @doc.xpath('//article').each do |info|
      article = {
        title: info.xpath('title').first.content,
        author: info.xpath('author').first.content,
        released_at: info.xpath('released_at').first.content,
      }
      add_article(article)
    end
  end
end