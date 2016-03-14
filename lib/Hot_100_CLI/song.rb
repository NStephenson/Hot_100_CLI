class Song

  attr_accessor :name, :artists, :rank, :weeks_charted, :peak_position, :previous_week


  def initialize(song_hash)
    @name = song_hash[:name]
    @rank = song_hash[:rank]
    @weeks_charted = song_hash[:weeks_charted]
    @peak_position = song_hash[:peak_position]
    @previous_week = song_hash[:previous_week]
  end

  







end