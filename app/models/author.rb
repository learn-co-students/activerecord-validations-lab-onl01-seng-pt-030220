class Author < ActiveRecord::Base
   validates :name, presence: true 
   validates :phone_number, presence: true,length: {in: 10..20}
   validates :name, uniqueness: true 

end
