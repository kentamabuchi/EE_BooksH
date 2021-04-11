class FavoriteBook < ApplicationRecord
    
    has_many :users, dependent: :destroy
    has_many :books, dependent: :destroy
    
end
