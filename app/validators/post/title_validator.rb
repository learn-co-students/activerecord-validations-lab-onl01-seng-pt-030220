class Post::TitleValidator < ActiveModel::Validator
    def validate(record)
        reqs = ["Won't Believe", "secret", "top", "guess"]
        unless record.title && reqs.any?{ |catchy_word| record.title.include?(catchy_word)}
            record.errors[:title] << "has a catchy phrase"
        end
    end
end