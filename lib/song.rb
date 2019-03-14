class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  # def initialize
  #   @@all << self
  # end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song

    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name

    song
  end

  def self.create_by_name(name)
    song =  self.new_by_name(name)
    @@all << song

    song
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song_by_name = self.find_by_name(name)
    song_by_name ? song_by_name : self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort{|a, b| a.name <=> b.name}
  end

  def self.new_from_filename(file_name)
    song_details = file_name.chomp(".mp3")
    song_details = song_details.split(" - ")

    song = self.new
    song.artist_name = song_details[0].strip
    song.name = song_details[1].strip

    song
  end

  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)

    @@all << song

    song
  end

  def self.destroy_all
    @@all = []
  end
end
