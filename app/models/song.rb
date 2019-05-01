class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: { scope: :release_year, message: "song already released"}
    validates :release_year, presence: true, inclusion: {in: 1..Time.now.year}, if: -> {song_released?}

    def song_released?
        released == true
    end

end
