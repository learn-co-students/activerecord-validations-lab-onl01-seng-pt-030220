class PostValidator < ActiveModel::Validator
    
    # clickbait = ["Won't Believe", "Secret", "Top [number]", "Guess"]

    # def validate
    #     if clickbait.none? { |pat| pat.match title}
    #         errors.add("This is clickbait")
    #     end
    # end

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
      
end