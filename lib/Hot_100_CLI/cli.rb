class Hot100::CLI

  def call

    greeting
    display_list
    puts "You may now choose to view the rest of the list or get more information on any of the songs on the list by typing the appropriate command. For a list of commands, type 'help'."
    menu
    farewell
  end

  def greeting
    puts "Hello, Welcome to the Billboard Top 100 CLI"
    puts "These are the top ten songs this week!"
  end 

  def display_list
    puts "1. Hotline Bling - Drake"
    puts "2. Sorry - Justin Beiber"
  end

  def menu
    input = nil
    while input != "exit" do
      puts "Please enter a command:"
      input = gets.chomp.downcase
      case input
      when "hot 100"
        display_list
      when /\d/
         if input.to_i.between?(1,100) 
          more_info 
        else
          puts "Not a valid entry, choose a number between 1 and 100"
        end
      when /\d-\d/
        #here I will split the two values, then if they are both valid and a valid range
        #that range will be returned to the user.
      when /\Aartist\s.+/
        display_artist_songs
      when /\Asong\s.+/
        more_info
      when "help"
        list_commands
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

  def display_artist_songs
    puts "hello world"
  end

  def more_info
    puts "hello world x2"
  end

end