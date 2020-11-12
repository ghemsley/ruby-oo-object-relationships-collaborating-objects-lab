class Artist
  @@all = []
  attr_accessor :name, :songs
  def initialize(name)
    @name = name
    @songs = []
    @@all.push(self)
  end

  def add_song(song)
    songs.push(song)
  end

  def print_songs
    songs.each do |song|
      puts song.name
    end
  end

  def self.find_or_create_by_name(name)
    found_artist = all.find do |artist|
      artist.name == name
    end
    if found_artist.nil?
      Artist.new(name)
    else
      found_artist
    end
  end

  def self.all
    @@all
  end
end
