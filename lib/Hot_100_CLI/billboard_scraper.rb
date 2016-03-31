require 'nokogiri'
require 'open-uri'
require 'pry'
class BillboardScraper


  def initialize
    doc = Nokogiri::HTML(open('http://www.billboard.com/charts/hot-100'))
    scrape(doc)
  end



 
  def scrape(doc)
    doc.css('.chart-data .chart-row').map do |entry|
      song_info = {}
      song_info[:chart_status] = { 
        rank: entry.css('.chart-row__current-week').text, 
        previous_week: entry.css('.chart-row__last-week .chart-row__value').text,
        peak_position: entry.css('.chart-row__top-spot .chart-row__value').text,
        weeks_charted: entry.css('.chart-row__weeks-on-chart .chart-row__value').text 
      } 

      song_info[:song] = { title: entry.css('.chart-row__song').text, 
                           link: parse_link_if_present(entry) }

      song_info[:artist] = { name: entry.css(".chart-row__artist").text.strip }
      create_song_from_scraper(song_info)
    end
  end


  def create_song_from_scraper(song_info)
    song = Song.create(song_info[:song])
    Artist.create_by_list_name(song_info[:artist]).each { |artist| song.artists << artist }
    song.chart_status = ChartStatus.new(song_info[:chart_status])

    song.chart_status.song = song
    song.artists.each { |artist| artist.songs << song }
  end


  def parse_link_if_present(entry)
    if !entry.css('.chart-row__player-link').empty?
      entry.css('.chart-row__player-link').attr('href').text
    else
      "error"
    end
  end


end