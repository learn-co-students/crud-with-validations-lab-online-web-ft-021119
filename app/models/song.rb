class Song < ApplicationRecord
  #https://guides.rubyonrails.org/active_record_validations.html
  validates :title, presence: true, uniqueness: { scope: [:release_year, :artist_name], message: "An artist may not release two songs with the same name in the same year."}
  validates :artist_name, presence: true
  validate :release_year_required
  validate :release_year_not_in_future


  def release_year_required
		if self.released == true && self.release_year == nil
			errors.add(:release_year, "Please add release year")
		end
  end

  def release_year_not_in_future
    if self.release_year && self.release_year.to_i > Date.today.year.to_i
      errors.add(:release_year, "must not be in the future")
    end
  end


end
