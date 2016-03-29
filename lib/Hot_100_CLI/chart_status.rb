class ChartStatus

  attr_accessor :song, :rank, :weeks_charted, :peak_position, :previous_week

  def initialize(song_info)
    @rank = song_info[:rank]
    @previous_week = song_info[:previous_week]
    @peak_position = song_info[:peak_position]
    @weeks_charted = song_info[:weeks_charted]
  end


  #need to add logic for songs with no previous week to be classified as new




end
