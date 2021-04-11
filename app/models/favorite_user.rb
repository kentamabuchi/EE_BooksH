class FavoriteUser < ApplicationRecord
    
    has_may :users, dependent: :destroy
    
end
