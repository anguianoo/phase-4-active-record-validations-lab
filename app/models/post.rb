class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {is: 250}
    validates :summary, length {is: 250}
    validates :category, inclusion: {in: ['Fiction', 'Non-Fiction']}

    CLICKBAIT_PATTERNS = [
        /Won't Believe/i,
        /Secret/i,
        /Top \d/i,
        /Guess/i
      ]
    
      def clickbait?
        if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
          errors.add(:title, "must be clickbait")
        end
      end
end
