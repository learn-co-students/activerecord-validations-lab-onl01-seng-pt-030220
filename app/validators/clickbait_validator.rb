# class ClickbaitValidator < ActiveModel::Validator 

# def validate(record) 
# if !titles(record)
#     record.errors[:title] << "Not Click-baity enough" 
# end
# end

# def titles(record)
#     valid_titles = ["Guess", "Secret", "Won't Believe", "Top"]
#     if valid_titles.include?(record[:title])
#         true
#     end
# end

# end