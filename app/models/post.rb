class Post < ActiveRecord::Base
    validates(:title, presence: true)
    validates(:content, { :length => { :minimum => 250 } })
    validates(:summary, { :length => { :maximum => 250 } })
    validates(:category, { :inclusion => { in: %w(Non-Fiction Fiction) } })
    validate :clickbait?

    @@clickbait = [
        /Won't Believe/,
        /Secret/,
        /Top \d/,
        /Guess/
    ]

    def clickbait?
        if title.present? && @@clickbait.none? {|phrase| phrase.match title}
            errors.add(:title, "Your title must be in clickbait!!")
        end
    end 
end
