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

end