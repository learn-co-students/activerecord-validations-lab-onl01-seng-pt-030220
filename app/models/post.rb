class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :click_bait

  def click_bait
    if title && !title.include?("Won't Believe"||"Secret"||"Top "||"Guess")
      errors.add(:title, "Your title needs to be more exciting!")
    end
  end

  #########learn.co solution
  # validate :is_clickbait?

  # CLICKBAIT_PATTERNS = [
  #   /Won't Believe/i,
  #   /Secret/i,
  #   /Top [0-9]*/i,
  #   /Guess/i
  # ]

  # def is_clickbait?
  #   if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
  #     errors.add(:title, "must be clickbait")
  #   end
  # end

  ##########micah solution

#   validate :is_clickbait

#   def is_clickbait
#     included = false
#     @@phrases.each { |phrase| included = true if self.title && self.title.downcase =~ phrase }
#     if not included
#         errors.add(:title, "You need a more exciting title")
#     end
# end

# @@phrases = [/won't believe/, /secret/, /top \d/, /guess/]

end
