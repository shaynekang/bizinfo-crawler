# encoding: UTF-8
require 'sinatra'

require './lib/board'
require './lib/crawler'
require './lib/urlinfo'
require './lib/rss_builder'

get '/venture' do
  board = Board.new
  board.url = "http://www.bizinfo.go.kr"

  crawler = Crawler.new
  crawler.crawl(board, URLInfo.get('venture'))
  RSSBuilder.build(board)
end

get '/financial' do
  board = Board.new
  board.url = "http://www.bizinfo.go.kr"

  crawler = Crawler.new
  crawler.crawl(board, URLInfo.get('financial'))
  RSSBuilder.build(board)
end