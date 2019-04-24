class SameYearValidator < ActiveModel::Validator

    def validate(record)
        Song.all.each do  |song| 
            if song.artist_name == record.artist_name && song.release_year == record.release_year && song.title == record.title
                record.errors[:released] << "Can't release two songs with the same title in one year."
            end
        end

    end

end
