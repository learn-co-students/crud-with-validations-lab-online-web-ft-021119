class Song < ApplicationRecord
   validates_presence_of :title, :artist_name
   validates :release_year, presence: true, inclusion: {in: 1..Time.now.year}, if: -> {has_released?}
   validates_uniqueness_of :title, if: -> {existing_artist?}

   private
   def has_released?
      !!self.released
   end

   def existing_artist?
      artist = Song.find_by_artist_name(self.artist_name)
   end
end
