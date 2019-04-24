class Song < ApplicationRecord
	validates :title , presence: true
	#validates :release_year, presence: true
	validate :released_year_validation?
	 validates :title, uniqueness: { scope: [:release_year, :artist_name],
    message: "should happen once per year" }

    with_options if: :released do |song|
    	song.validates :release_year, presence: true
    	
    end



	def released_year_validation?

		

				if release_year.to_i > Date.today.year
					errors.add(:release_year)
				

	 			end
	 end


end



