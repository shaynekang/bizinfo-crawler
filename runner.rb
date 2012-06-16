require 'sinatra'
require './lib/board'
require './lib/crawler'

class RSSInfo
  class << self
    def get(key)
      case key
      when 'venture'
        'http://www.bizinfo.go.kr/userPolicyInfoList.do?policyInfoSerchTO.lclasId=5000'
      end
    end
  end
end

get '/venture' do
  board = Board.new
  crawler = Crawler.new
  crawler.crawl(board, RSSInfo.get('venture'))
  board.to_rss
end
