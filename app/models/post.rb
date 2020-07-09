require 'pry'
class Post < ActiveRecord::Base

  validates :title, presence: true 
  validates :title, uniqueness: true 
 
  validates :content, length: { minimum: 10 }
  validates :summary, length: { maximum: 10 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait 

private

  def clickbait

    if title.blank?
      return false
    elsif ! title.include?('Guess') && ! title.include?('Secret') &&  ! title.include?("Won't Believe")  &&  ! title.include?('Top[number]') 
      errors.add(:title, "Your title not clickbait")
    end
    
  end
    

end




