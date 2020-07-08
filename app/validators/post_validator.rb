class PostValidator < ActiveModel::Validator
    
  clickbait_strings = [
    "Won't Believe",
    "Secret",
    "Top 0",
    "Top 1",
    "Top 2",
    "Top 3",
    "Top 4",
    "Top 5",
    "Top 6",
    "Top 7",
    "Top 8",
    "Top 9",
    "Guess"
  ]
  def is_clickbait?
    idx = 0
    clickbait_exists = false
    if title
      while idx < clickbait_string.size
          if title.index(clickbait_string[idx])
            clickbait_exists = true
            break
          else
            idx = idx + 1
          end
      end
    end
    if clickbait_exists == false
      errors.add(:title, "must be clickbait")
    end
  end

  # def clickbait 
  #   if !title.nil? && (!title.include?("You Won't" || "Secret" || "Top" || "Guess")) 
  #       errors.add(:clickbait, "Click Bait!")
  #   end 
  # end


end

# include ActiveModel::Validations #this line would be added to app/models/post.rb in the Post class
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
