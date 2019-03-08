require "pry"
class Song 
  attr_accessor :name, :artist 
  def initialize(name)
    @name = name 
  end 

  def self.new_by_filename(file)
    array = file.split(" - ") #["Michael Jackson", "Black or White", "pop.mp3"]
    song_string = array[1]
    artist_string = array[0]
    
    #create song
    new_song = self.new(song_string)
    
    #find out if artist already exists, if not then create said artist
    new_artist = Artist.find_or_create_by_name(artist_string)
    
     #this this song belongs to this instance of an artist
    new_song.artist = new_artist 
    
    #save then pushes this freshly creates instance into the @@all of Artist
    new_artist.save
    
    #for artist to keep track it's songs [] << @song
    new_artist.add_song(new_song)
    
    #return song 
    new_song
  end 
end 
#from ask a question 
# Song#artist_name=(name)
# This method will do two things. Both of these things will involve collaboration with the Artist class:

# Turn the artist's name as a string into an artist object

# First we need to get the instance of the Artist class that represents that artist. There are two possibilities here:

# Either we have to create that artist instance
# Or it already exists and we have to find that artist instance.
# To achieve this, we'll need to collaborate with the Artist class. We want to send the artist's name (a string--remember we are getting this from the parsed filename) to the Artist class to achieve the functionality described above in #1 and #2. Let's call this method Artist.find_or_create_by_name(artists-name-here).

# Assign the song to the artist (Since an artist has many songs, we'll want to make this association)

# Now that we have the artist instance, we'll want to again collaborate with the Artist class by calling on the Artist#add_song(some_song) method.