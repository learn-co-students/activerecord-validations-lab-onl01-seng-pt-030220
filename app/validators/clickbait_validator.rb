class ClickbaitValidator < ActiveModel::Validator
  def validate(record)
    unless record.title && record.title.include?("Won't Believe")
      record.errors[:title] << "Need validation."
    end
  end
end
