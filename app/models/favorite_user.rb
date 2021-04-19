class FavoriteUser < ApplicationRecord
    
    belongs_to :user
    belongs_to :favorite_user,  class_name: 'User'
    
    validates_uniqueness_of :favorite_user_id, scope: :user_id
    
end
