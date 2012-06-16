require 'sinatra'
require './lib/board'
require './lib/crawler'
require './lib/urlinfo'

get '/venture' do
  board = Board.new
  crawler = Crawler.new
  crawler.crawl(board, URLInfo.get('venture'))
  board.to_rss
end
