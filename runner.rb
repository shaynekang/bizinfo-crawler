require 'sinatra'
require './lib/board'
require './lib/crawler'

get '/venture' do
  board = Board.new
  crawler = Crawler.new
  # crawler.crawl(board, 'spec/fixture/list.html')
  crawler.crawl(board, 'http://www.bizinfo.go.kr/userPolicyInfoList.do?policyInfoSerchTO.lclasId=5000')
  board.to_rss
end
