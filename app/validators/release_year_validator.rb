class ReleaseYearValidator < ActiveModel::Validator 

    def validate(record)
        if record.released == true && record.release_year == nil
            record.errors[:release_year] << "You need to specify a release year for a song that has been released."
        end      
    end

end
