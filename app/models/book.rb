class Book < ApplicationRecord
    
    has_many :reviews, dependent: :destroy
    has_many :good_books, dependent: :destroy
    has_many :favorite_books, dependent: :destroy
    has_many :violations, dependent: :destroy
    belongs_to :classification
    belongs_to :genre
    
    attachment :image
    
    validates :name, presence: true
    validates :writer, presence: true
    
    def how_long_passed
        if (Time.now - self.updated_at) <= 60*60
            ((Time.now - self.updated_at) / 60).to_i.to_s + "分前"
        elsif (Time.now - self.updated_at) <= 60*60*24
            ((Time.now - self.updated_at) / 3600).to_i.to_s + "時間前"
        elsif (Date.today - self.updated_at.to_date) <= 30
            (Date.today - self.updated_at.to_date).to_i.to_s + "日前"
        else (Date.today - self.updated_at.to_date) >= 30
            ((Date.today - self.updated_at.to_date) / 30).to_i.to_s + "カ月前"
        end
    end

end
