# encoding: UTF-8
require 'sinatra'

require './lib/board'
require './lib/crawler'
require './lib/urlinfo'
require './lib/rss_builder'

get '/venture' do
  board = Board.new
  crawler = Crawler.new
  crawler.crawl(board, URLInfo.get('venture'))
  RSSBuilder.build(board)
end
