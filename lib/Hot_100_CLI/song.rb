class Song

  attr_accessor :title, :artists, :chart_status

  @@all = []

  def initialize(title)
    @title = title
    @artists = []
  end

  def self.create(title)
    song = Song.new(title)
    Song.all << song
    song
  end


  def self.all
    @@all
  end

  def save
    @@all << self
  end




end