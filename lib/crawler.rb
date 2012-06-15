#encoding: UTF-8
require './lib/board'

class Crawler
  def crawl(board, filename)
    @doc = Nokogiri::HTML(open(filename))
    @doc.css("table.tbl tbody tr").map do |link|
      table_data = link.css('td')
      informations = table_data.map { |info| info.content.strip }
      link = table_data.css('a').first['href']
      board.add_article({
        title: informations[1],
        author: informations[2],
        link: link,
        released_at: informations[3]
      })
    end
  end
end