require 'Launchy'
class Hot100::CLI

  def call
    puts 'Starting...'
    puts ' '
    BillboardScraper.new
    greeting
    display_songs_in_range("1-10")
    puts "You may now choose to view the rest of the list or get more information on any of the songs on the list by typing the appropriate command. For a list of commands, type 'help'."
    puts " "
    menu
    farewell
  end

  def greeting
    puts "Hello, Welcome to the Billboard Top 100 CLI"
    puts " "
    puts "These are the top ten songs this week!"
    puts " "
    puts "For the full list type 'hot 100'!"
  end 

  def menu
    input = nil
    while input != "exit" do
      puts "Please enter a command:"
      input = gets.chomp.downcase
      case input
      when "hot 100"
        display_songs_in_range("1-100")
      when /\A\d+\z/
         if input.to_i.between?(1,100) ###################### Should be it's own method
          more_info_song(input) ################################### need to code this method
        else
          puts "Not a valid entry, choose a number between 1 and 100"
        end
      when /\A\d+-\d+\z/
        if valid_range?(split_input_to_range(input))
          display_songs_in_range(input)
        else
          puts "That number range feels off. Check your numbers and format and try again."
        end
      when /\Aartist\s.+/
        display_artist_songs(input) #make logic for when artist isn't found
      when /\Aartists\z/
        display_artist_list
      when /\Asong\s.+/
        more_info_song(input) #add logic for when song is found
      when "help"
        list_commands
      when "exit"
        puts "Aw that's it?"
      else
        puts "That command seems to be invalid, type 'help' for a list of commands."
      end
    end
  end

  def list_commands
    puts "To see the full billboard list, type hot 100. Otherwise enter a range of entries to view"
    puts "For more info on a song, type 'song' followed by that song's name or chart position"
    puts "To see all charted songs by a particular artist, type 'artist' followed by that artist's name"
    puts "To exit, simply type exit"
    puts "For help, type help, but I think you have this one figured out already."
  end

  def farewell
    puts "See You Next Tuesday."
  end

  def display_artist_songs(input)
    artist = Artist.find_by_name(input.split('artist ')[1])
    if artist
      puts ' '
      puts "This week, #{artist.name} charted these songs:"
      puts ' '
      artist.songs.each { |song| puts "#{song.rank}. #{song.title}" }
      puts ' '
    else
      puts ' '
      puts "That artist isn't on the charts this week. Maybe next week?"
      puts ' '
    end
  end

  def more_info_song(input)
    if !input[/\Asong/]
      song = Song.find_by_rank(input)
    else
      song = Song.find_by_title(input.split("song ")[1])
    end
    if song
      puts ' '
      puts "     #{song.title}"
      puts  "          By #{song.artist_listing}"
      puts ' '
      puts "This week, #{song.title} was number #{song.rank} on the Billboard Top 100 Charts."
      puts ' '
      song_history(song)
      ask_to_play_song(song)
    else
      puts "That song doesn't seem to be on the charts this week."
    end
  end

  def valid_range?(range)
    range[0].between?(1,99) && range[1].between?(2,100) && range[0] < range[1]
  end

  def split_input_to_range(input)
    input.split("-").map { |num| num.to_i }
  end

  def display_songs_in_range(input)
    range = split_input_to_range(input)
    songs = Song.all.select do |song|
      song.rank >= range[0] && range[1] >= song.rank
    end 
    display_songs(songs)
  end

  def display_songs(songs)
    songs.each { |song| puts "#{song.rank}. #{song.title} - #{song.artist_listing}" }
    puts " "
    puts "For more info on a song, please type it's rank or type 'song ' then the song's title."
  end


  def ask_to_play_song(song)
    puts ' '
    puts 'To listen to this song on spotify, type \'listen\'. To watch this song\'s music video, type \'watch\'. Otherwise, type \'exit\'.'
    puts ' '
    input = gets.chomp
    if input == 'listen'
      launch_spotify_link(song)
    elsif input == 'watch'
      launch_vevo_link(song)
    end
  end

  def launch_spotify_link(song)
    if song.spotify_link != 'error'
      Launchy.open(song.spotify_link)
      puts ' '
      puts '♪ ♪ ♪ Enjoy!♪ ♪ ♪' 
      puts ' '
    else
      puts ' '
      puts 'Unfortunately, it this song is not on Spotify :('
      puts ' '
    end
  end

  def launch_vevo_link(song)
    if song.vevo_link != 'error'
      Launchy.open(song.vevo_link)
      puts ' '
      puts '♪ ♪ ♪ Enjoy!♪ ♪ ♪' 
      puts ' '
    else
      puts ' '
      puts 'Unfortunately, it this song is not on Vevo :('
      puts ' '
    end
  end

  def song_history(song) #need to add logic for a song returning to the top 100
    if song.chart_status.is_new?
      puts "This is #{song.title}'s debut week on the Hot 100 charts!"
    else
      song.chart_status.position_change
      song.chart_status.peak_status
      song.chart_status.weeks_status
    end
  end

  def display_artist_list
    Artist.all.each do |artist|
      puts artist.name
    end

  end





end