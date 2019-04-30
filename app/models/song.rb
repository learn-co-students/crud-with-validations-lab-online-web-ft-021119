class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :artist_name, presence: true
  # validates :released, inclusion: {in: %w(true false)}

  validate :valid_release_year?
  # validate :release_year_cannot_be_in_the_future

  def valid_release_year?
    return true unless released

    year = release_year.to_i
    if year.zero?
      errors.add(:release_year, 'must be a valid year')
    elsif year > Date.today.year
      errors.add(:release_year, "can't be in the future")
    end
  end

  #   @song = Song.find(:title)
  #   if self.artist_name == @song.artist_name && self.release_year == self.release_year
  #     errors.add(:repeated_song, "artist cannot repeat the same song in the same year")
  #   end
  # end
  #
  # def release_year_cannot_be_in_the_future
  #   if release_year.present? && release_year < Date.today.year
  #     errors.add(:release_year, "can't be in the future")
  #   end
  # end
end
