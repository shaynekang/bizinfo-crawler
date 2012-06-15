#encoding: UTF-8
require './lib/board'

class Crawler
  def crawl(board, filename)
    @doc = Nokogiri::HTML(open(filename))
    @doc.css("table.tbl tbody tr").map do |link|
      informations = link.css('td').map{|info| info.content.strip}
      board.add_article({
        title: informations[1],
        author: informations[2],
        released_at: informations[3]
      })
    end
  end
end