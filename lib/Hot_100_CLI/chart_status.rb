class ChartStatus

  attr_accessor :song, :rank, :weeks_charted, :peak_position, :previous_week

  def initialize(song_info)
    @rank = song_info[:rank].to_i
    @previous_week = song_info[:previous_week].to_i
    @peak_position = song_info[:peak_position].to_i
    @weeks_charted = song_info[:weeks_charted].to_i
  end


  #need to add logic for songs with no previous week to be classified as new

  def self.new_songs
    Song.all.select { | song | song.previous_week == "--" }
  end

  def is_new?
    previous_week == "--"
  end

  def position_change
    if previous_week > rank
      puts "#{song.title} moved up from \##{previous_week} to \##{rank}!"
    elsif previous_week < rank
      puts "#{song.title} moved down from \##{previous_week} to \##{rank}."
    elsif previous_week == rank
      puts "#{song.title} remained at #{rank}."
    end
  end

  def peak_status
    if rank == peak_position
      puts "It's currently at it's peak position!!"
    else
      puts "It's down from it's peak position, which was number #{peak_position}."
    end  
  end

  def weeks_status
    puts "#{song.title} has been on the charts for #{weeks_charted} weeks."
  end
    





end
