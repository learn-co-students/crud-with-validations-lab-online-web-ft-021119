class Song < ApplicationRecord
  validates :title, :artist_name, presence: true
  validates_uniqueness_of :title, if: -> {has_artist?}
  validates :release_year, presence: true, inclusion: {in: 1..Time.now.year}, if: -> {has_released?}

  private

  def has_artist?
    @artist = Song.find_by_artist_name(self.artist_name)
  end

  def has_released?
    !!self.released #<- !! makes it boolean
  end
end
