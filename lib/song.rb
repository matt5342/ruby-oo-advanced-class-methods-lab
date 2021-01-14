require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create
    song = self.new
    @@all << song
    song.save
    song
  end
  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end
  def self.find_by_name(name)
    @@all.find do |person|
      person.name == name
    end
  end
  def self.find_or_create_by_name(song)
    if self.find_by_name(song)
      self.find_by_name(song)
    else
      self.create_by_name(song)
    end
  end
  def self.alphabetical
    @@all.sort_by! do |song|
      song.name[0]
    end
  end
  def self.new_from_filename(file)

    first_split = file.split("-")
    artist = first_split[0].delete_suffix(' ')
    second_split = first_split[1].split(".")
    song = second_split[0].delete_prefix(' ')
    file_type = second_split[1]
    new_song = self.new
    new_song.name = song
    new_song.artist_name = artist
    new_song
  end

  def self.create_from_filename(file)
    new_song =self.new_from_filename(file)
    new_song.save
  end

  def self.all
    @@all
  end
  def self.destroy_all
    @@all = []
  end

  def save
    self.class.all << self
  end

end
