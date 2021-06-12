class Review < ApplicationRecord
    
    belongs_to :user, optional: true
    belongs_to :book, optional: true
    has_many :return_comments, dependent: :destroy
    
    def self.all_reviews(follower, current_user)
        Review.where(user_id: follower) + current_user.reviews
    end
    
end
