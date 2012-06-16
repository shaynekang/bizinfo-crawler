#encoding: UTF-8
require 'nokogiri'
require 'open-uri'

require './lib/board'
require './lib/article'

class Crawler
  def crawl(board, filename)
    @doc = Nokogiri::HTML(open(filename))
    @doc.css("table.tbl tbody tr").map do |link|
      table_data = link.css('td')
      link = table_data.css('a').first['href']
      other_informations = table_data.map { |info| info.content.strip }

      article = Article.new({
        title: other_informations[1],
        author: other_informations[2],
        link: link,
        released_at: other_informations[3]
      })
      board.add_article(article)
    end
  end
end