# encoding: UTF-8
require 'nokogiri'
require 'open-uri'
require 'rss/maker'

class RSSBuilder
  RSS_VERSION = "2.0"

  class << self
    def build(board)
      RSS::Maker.make(RSS_VERSION) do |maker|
        maker.channel.title = "비즈인포 창업/벤처 RSS"
        maker.channel.link = "http://www.bizinfo.go.kr/userPolicyInfoList.do?policyInfoSerchTO.lclasId=5000"
        maker.channel.description = "비즈인포 창업/벤처 게시판의 RSS리스트입니다."
        maker.items.do_sort = true
        board.articles.each do |article|
          maker.items.new_item do |item|
            item.title = "[#{article[:author]}]#{article[:title]}"
            item.link = "http://www.bizinfo.go.kr#{article[:link]}"
            item.updated = article[:released_at]
          end
        end
      end.to_s
    end
  end
end