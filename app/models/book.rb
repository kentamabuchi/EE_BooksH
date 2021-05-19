class Book < ApplicationRecord
    
    has_many :reviews, dependent: :destroy
    has_many :good_books, dependent: :destroy
    has_many :favorite_books, dependent: :destroy
    belongs_to :classification
    belongs_to :genre
    
    attachment :image
    
    validates :name, presence: true
    validates :writer, presence: true

end
