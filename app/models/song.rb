class Song < ApplicationRecord
    validates :title, presence: :true
    validates_inclusion_of :released, in: [true, false]
    validates :artist_name, presence: :true
    validates_with ReleaseYearValidator
    validates_with SameYearValidator
    validates_with FutureReleaseValidator    

end
