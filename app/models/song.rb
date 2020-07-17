class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes


  def artist_name=(artist)
    self.artist = Artist.find_or_create_by(name: artist)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end
 #we are adding this here to represent what song_notes are
  def song_notes=(notes)
    notes.each do |note|
      self.notes.build(content: note)
    end
  end
  #we are adding this to turn the genre id id number into an integer
  def genre=(id)
    self.genre_id = id.to_i
  end

end
