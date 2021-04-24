class Classification < ApplicationRecord
    
    has_many :books, dependent: :destroy
    
end
