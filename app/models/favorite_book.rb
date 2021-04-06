class FavoriteBook < ApplicationRecord
    
    has_many :Users, dependent: :destroy
    has_many :Books, dependent: :destroy
    
end
