class FavoriteUser < ApplicationRecord
    
    has_may :Users, dependent: :destroy
    
end
