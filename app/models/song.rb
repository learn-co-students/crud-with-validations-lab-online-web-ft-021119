class Song < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, numericality: {less_than_or_equal_to: :current_year}, presence: true, if: :released?
  validates :artist_name, presence: true
  validates :genre, presence: true

  def released?
    released == true
  end

  def current_year
    Time.current.year
  end

end
