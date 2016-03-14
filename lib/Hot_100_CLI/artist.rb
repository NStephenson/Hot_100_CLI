class Artist

  attr_accessor :name, :songs


  def initialize(name)
    @name = name
  end


  def split_features(list_name)
    list_name.split(" Featuring ")
  end




end