class Book < ApplicationRecord
    
    belongs_to :Classification
    belongs_to :Genre
    
end
