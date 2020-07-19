class TitleValidator < ActiveModel::Validator 
    def validate(record)
        if record.title
            phrases = ["won't believe", "secret", "top /\d/", "guess"]
            if phrases.detect {|p| record.title.include?(p)}.nil?
            record.errors[:title] << "This is clickbait, please don't click."
            end
        end
    end
end
