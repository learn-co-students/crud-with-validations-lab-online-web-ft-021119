class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: { scope: [:release_year, :artist_name], message: "This artist already has a song by this title released this year. Please try again."}
  validates :artist_name, presence: true
  validate :release_year_required
  validate :release_year_not_in_future

  def release_year_required
    if self.released == true && self.release_year == nil
      errors.add(:release_year, "Please add a release year")
    end
  end

  def release_year_not_in_future
    if self.release_year.to_i > Date.today.year.to_i
      errors.add(:release_year, "must not be in the future")
    end
  end

end
