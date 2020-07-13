class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length:{minimum:250}
    validates :summary, length:{maximum:250}
    validates :category, inclusion: ["Fiction", "Non-Fiction"]
    validate :click_baity
 
  def click_baity
    # titles = self.title
    valid_titles = ["Guess", "Secret", "Won't Believe", "Top"]
    valid_titles.each do |a| 
       if title && title.include?(a) 
       return true 
        # else
        # false 
        end

      end 
      errors.add(:title, "must be clickbait")
  end 


    # include ActiveModel::Validations
    # validates_with ClickbaitValidator 

end
