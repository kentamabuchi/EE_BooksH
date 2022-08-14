class Review < ApplicationRecord
    
    belongs_to :user, optional: true
    belongs_to :book, optional: true
    has_many :return_comments, dependent: :destroy
    
    def self.all_reviews(follower, current_user)
        Review.where(user_id: follower) + current_user.reviews
    end
    
    def how_long_passed
        if (Time.now - self.created_at) <= 60*60
            ((Time.now - self.created_at) / 60).to_i.to_s + "分前"
        elsif (Time.now - self.created_at) <= 60*60*24
            ((Time.now - self.created_at) / 3600).to_i.to_s + "時間前"
        elsif (Date.today - self.created_at.to_date) <= 30
            (Date.today - self.created_at.to_date).to_i.to_s + "日前"
        else (Date.today - self.created_at.to_date) >= 30
            ((Date.today - self.created_at.to_date) / 30).to_i.to_s + "カ月前"
        end
    end
    
end
