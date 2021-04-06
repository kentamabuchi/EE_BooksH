class Classification < ApplicationRecord
    
    has_many :Books, dependent: :destroy
    
end
