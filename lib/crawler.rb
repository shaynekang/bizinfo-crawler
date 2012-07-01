# encoding: UTF-8
require 'nokogiri'
require 'open-uri'

require './lib/article'

class Crawler
  def crawl(board, filename)
    list = Nokogiri::HTML(open(filename))
    list.css("table.tbl tbody tr").map do |link|
      table_data = link.css('td')
      link = table_data.css('a').first['href']
      other_informations = table_data.map { |info| info.content.strip }

      item = Nokogiri::HTML(open(board.url + link))
      description = item.css('.a_area3 li.icon_arr4').first.content

      article = Article.new({
        title: other_informations[1],
        author: other_informations[2],
        description: description,
        link: link,
        released_at: other_informations[3]
      })
      board.add_article(article)
    end
  end
end