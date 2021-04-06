class Genre < ApplicationRecord
    
    has_may :Books, dependent: :destroy
    
end
