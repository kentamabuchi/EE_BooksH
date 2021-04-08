class Genre < ApplicationRecord
    
    has_many :Books, dependent: :destroy
    
end
