class Post < ActiveRecord::Base
    # include ActiveModel::Validations
    # validates_with Post::TitleValidator, on: :create

    validate :validate_title

    validates :title, presence: true
    
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} is not a valid category"}

    private

    def validate_title
        reqs = ["Won't Believe", "secret", "top", "guess"]
        unless self.title && reqs.any?{ |catchy_word| self.title.include?(catchy_word)}
            self.errors[:title] << "has a catchy phrase"
        end
    end
end
