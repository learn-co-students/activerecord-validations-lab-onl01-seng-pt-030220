class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250 }
    validates :summary, length: {maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    
    validate :clickbait

    # CLICKBAIT_PHRASES = [/Won't Believe/i, /Secret/i, /Top \d/i, /Guess/i]

    def clickbait
        if title && !title.include?("Won't Believe"||"Secret"||"Top"||"Guess")
            errors.add(:title, "This isn't clickbait!")
        end
        # if self.title.include?("Won't Believe" || "Secret" || "Top" || "Guess")
        #     errors.add(:title, "This is clickbait.")
        # end
        # if CLICKBAIT_PHRASES.present? {|p| self.title.include?(p)}.nil?
        #     errors.add(:title, "This is clickbait.")
        # end
    end
end
