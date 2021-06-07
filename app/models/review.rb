class Review < ApplicationRecord
    
    belongs_to :user, optional: true
    belongs_to :book, optional: true
    
    def self.all_reviews(follower, current_user)
        Review.where(user_id: follower) + current_user.reviews
    end
    
end
