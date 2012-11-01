# encoding: UTF-8
require 'rss/maker'

class RSSBuilder
  RSS_VERSION = "2.0"

  class << self
    def build(board)
      RSS::Maker.make(RSS_VERSION) do |maker|
        maker.channel.title = "Bizinfo's venture and finantial RSS"
        maker.channel.link = "#{board.url}userPolicyInfoList.do?policyInfoSerchTO.lclasId=5000"
        maker.channel.description = "Rss of Bizinfo's venture and finantial forum."
        maker.items.do_sort = true
        board.articles.each do |article|
          maker.items.new_item do |item|
            item.title = "[#{article.author}]#{article.title}"
            item.description = article.description
            item.link = "#{board.url}#{article.link}"
            item.updated = article.released_at
          end
        end
      end.to_s
    end
  end
end