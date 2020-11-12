class MP3Importer
  REGEX = /^([\w\- [:punct:]]+) - ([\w\- [:punct:]]+) - ([\w\- [:punct:]]*)\.mp3$/i.freeze
  attr_accessor :path
  def initialize(path = Dir.pwd)
    @path = path
  end

  def files
    paths = Dir.entries(path).select do |full_path|
      full_path.match(REGEX)
    end
    paths.collect do |full_path|
      File.basename(full_path)
    end
  end

  def import
    files.each do |filename|
      Song.new_by_filename(filename)
    end
  end
end
