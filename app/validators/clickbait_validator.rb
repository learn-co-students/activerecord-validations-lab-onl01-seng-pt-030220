class ClickbaitValidator < ActiveModel::Validator
    def validate(record)
        if record.title != nil
            clickbait = ["Won't Believe", "Secret", "Top /[0-9]/", "Guess"]
            clickbait.each do |key|
                if record.title.include?(key)
                    return true
                else
                    record.errors[:clickbait] << "The title doesnt grab my attention!"
                end
            end
        end
    end
end