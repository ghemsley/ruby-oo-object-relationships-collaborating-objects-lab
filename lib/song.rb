class Song
  @@all = []
  attr_accessor :name
  attr_reader :artist
  def initialize(name)
    @name = name
    @artist = nil
    @@all.push(self)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end

  def self.new_by_filename(filename)
    song_array = filename.scan(MP3Importer::REGEX).flatten
    song = new(song_array[1])
    song.artist_name = song_array[0]
    song
  end

  def self.all
    @@all
  end
end
