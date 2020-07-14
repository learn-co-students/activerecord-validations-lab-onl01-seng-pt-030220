class Post < ActiveRecord::Base
  validates :content, length: { minimum: 250 };
  validates :summary, length: { maximum: 250 };
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) };
  validate :title_not_clickbait

  def title_not_clickbait
    unless title && title.include?("Won't Believe") || title && title.include?("Secret") || title && title.include?("Top") || title && title.include?("Guess")
      errors.add(:title, "Not clickbait")
    end
  end

end