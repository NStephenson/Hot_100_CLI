class Artist

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []

  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.find_by_name(name)
    all.detect { |artist| artist.name.downcase == name.downcase }
  end

 
  def self.create_by_list_name(list_name)
    artists = []
    list_name[:name].split(" Featuring ").map do |name|
      if name.include?(" & ")
        name.split(" & ").map do |name|
          artists << Artist.find_or_new_by_name(name)
        end
      else
        artists << Artist.find_or_new_by_name(name)
      end
    end
    artists
  end

  def self.find_or_new_by_name(name)
    if self.all.detect{ |song| song.name == name  }
      artist = self.all.detect{ |song| song.name == name  }
    else 
      artist = Artist.new(name)
      artist.save
    end
    artist
  end


end