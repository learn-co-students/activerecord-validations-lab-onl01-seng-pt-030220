class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} is not a valid category" }
    validate :title_not_clickbaity_enough

    def title_not_clickbaity_enough
        unless title && title.include?("Won't Believe") || title && title.include?("Secret") || title && title.include?("Top") || title && title.include?("Guess")
          errors.add(:title, "Not clickbaity enough")
        end
    end
end
