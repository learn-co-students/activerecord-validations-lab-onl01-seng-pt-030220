class Post < ActiveRecord::Base
  validates :title, presence: true;
  validates :content, length: { minimum: 250 };
  validates :summary, length: { maximum: 250 };
  validates :category, inclusion: { in: %w{fiction non-fiction}, message: "%{value} is not a valid category"};
  validate :title_not_clickbaity_enough

  def title_not_clickbaity_enough
binding.pry
    unless title.starts_with?("Won't Believe") || title.starts_with?("Secret") || title.starts_with?("Top") || title.starts_with?("Guess")
      errors.add(:title, "Not clickbaity enough")
    end
  end

end