class Song

  attr_accessor :title, :artists, :link, :chart_status

  @@all = []

  def initialize(title)
    @title = title
    @artists = []
  end

  def self.create(song_hash)
    song = Song.new(song_hash[:title])
    song.link = song_hash[:link]
    song.save
    song
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.find_by_title(title)
    Song.all.detect { |song| song.title.downcase == title.downcase }
  end

  def self.find_by_rank(int)
    Song.all.detect { |song| song.rank == int.to_i }
  end


  #association methods


  def rank
    chart_status.rank
  end

  def weeks_charted
    chart_status.weeks_charted
  end

  def peak_position
    chart_status.peak_position
  end

  def previous_week
    chart_status.previous_week
  end

  def artist_listing
    artists.map { |artist| artist.name }.join(" Featuring ")
  end

end