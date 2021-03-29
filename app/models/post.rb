class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :clickbait?, if: :title
    # # validates :clickbait, inclusion: { in: %w(Won't Believe Secret Top Guess) }
    
    # clickbait = [ /Won't Believe/i, /Secret/i, /Top/i, /Guess/i ]
    def clickbait?
       
        if !self.title.match(/Won't Believe/i) && !self.title.match(/Secret/i) && !self.title.match(/Top/i) && !self.title.match(/Guess/i)
            errors.add(:title, "must be clickbait")
        end
    end

    

    

end
