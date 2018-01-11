require 'pry'

class Song
  attr_accessor :name, :artist, :genre
  @@all = []
  @@count = 0
  @@artists = []
  @@genres = []

  def initialize(name, artist, genre)
    @name = name
    @artist = artist
    @genre = genre
    @@all << [name, artist, genre]
    @@artists << artist
    @@genres << genre
    @@count += 1
  end

  def self.all
    @@all
  end

  def self.count #returns how many songs are in @@all
    @@count
  end

  def self.genres
    @@genres.uniq
  end

  def self.artists
    @@artists.uniq
  end

  def save
    self.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.name
    self.all.name
  end

  def self.genre_count
    genre_count = {}
    @@genres.uniq.map { |g| genre_count[g] = @@genres.count(g) }
    genre_count
  end

  def self.artist_count
    artist_count = {}
    @@artists.uniq.map { |g| artist_count[g] = @@artists.count(g) }
    artist_count
  end
  #binding.pry
  # def self.new_by_name(name)
  #   song = self.new
  #   song.name = name
  #   song
  # end
  #
  # def self.create_by_name(name)
  #   song = self.new_by_name(name)
  #   song.save
  #   song
  # end

  # def self.find_by_name(name)
  #   self.all.detect { |song| song.name == name }
  # end
  #
  # def self.find_or_create_by_name(name)
  #   song = self.find_by_name(name)
  #   if song
  #     song
  #   else
  #     self.create_by_name(name)
  #   end
  # end
  #
  # def self.alphabetical
  #   self.all.sort_by { |song| song.name }
  # end
  #
  # def self.new_from_filename(filename)
  #   split_filename = filename.split(/[-.]/)
  #   artist = split_filename[0].strip
  #   song = split_filename[1].strip
  #   song = self.find_or_create_by_name(song)
  #   song.artist_name = artist
  #   song
  # end
  #
  # def self.create_from_filename(filename)
  #   split_filename = filename.split(/[-.]/)
  #   artist = split_filename[0].strip
  #   song = split_filename[1].strip
  #   song = self.find_or_create_by_name(song)
  #   song.artist_name = artist
  #   song.save
  #   song
  # end

  # def self.destroy_all
  #   self.all.clear
  # end
end
