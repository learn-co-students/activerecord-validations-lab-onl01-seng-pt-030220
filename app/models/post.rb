class Post < ActiveRecord::Base
  
  validates :title, presence: true
  validate :clickbait
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}  
  
  def clickbait
    if title && !title.include?("Won't Believe" || "Secret" || "Top" || "Guess")
      errors.add(:title, "Bad title")    
    end 
  end 
end
