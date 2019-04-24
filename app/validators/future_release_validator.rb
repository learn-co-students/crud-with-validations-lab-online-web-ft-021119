class FutureReleaseValidator < ActiveModel::Validator
    def validate(record)
        if record.release_year && record.release_year > Time.now.year
            record.errors[:release_year] << "A song cannot be released in the future."
        end
    end

end
