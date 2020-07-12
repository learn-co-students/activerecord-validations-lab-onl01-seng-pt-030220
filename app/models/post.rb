class Post < ActiveRecord::Base
    validates :title, presence:true
    validates :content, length:{minimum:250}
    validates :summary, length:{maximum:250}
    validates :category, inclusion: ["Fiction", "Non-Fiction"]
    validate :click_baity
 
  def click_baity
    valid_titles = ["Guess", "Secret", "Won't" "Believe", "Top"]
    
  end

    # include ActiveModel::Validations
    # validates_with ClickbaitValidator 

end
