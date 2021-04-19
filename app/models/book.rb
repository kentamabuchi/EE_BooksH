class Book < ApplicationRecord
    
    has_many :reviews, dependent: :destroy
    has_many :good_books, dependent: :destroy
    has_many :favorite_books, dependent: :destroy
    belongs_to :classification
    belongs_to :genre
    
    attachment :image
    
    enum edit_status: {未編集:true, 編集済み:false}
    enum is_active: {正常:true, 違反:false}

end
