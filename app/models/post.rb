class Post < ActiveRecord::Base

    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction),
        message: "%{value} is not a valid option" }
    
    # validates_with PostValidator
    validate :is_clickbait?
    CLICKBAIT_PATTERNS = [
        /Won't Believe/i,
        /Secret/i,
        /Top [0-9]*/i,
        /Guess/i
      ]
    
      def is_clickbait?
        if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
          errors.add(:title, "must be clickbait")
        end
      end


  # @@phrases = [/won't believe/, /secret/, /top \d/, /guess/]
  # def is_clickbait
  #   included = false
  #   @@phrases.each { |phrase| included = true if self.title && self.title.downcase =~ phrase }
  #   if not included
  #     errors.add(:title, "You need a more exciting title")
  #   end
  # end

end

# validates_with TitleValidator #this line would be added to app/models/post.rb in the Post class

# class TitleValidator < ActiveModel::Validator
#   def validate(record)
#     clickbait = ["Won't Believe", "Secret", "Top", "Guess"]
#     if record.title
#       unless clickbait.any?{ |w| record.title.include?(w)}
#         record.errors[:title] << "Click bait!"
#       end
#     end
#   end
# end
