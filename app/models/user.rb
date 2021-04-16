class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  attachment :image
  
  has_many :reviews, dependent: :destroy
  has_many :good_books, dependent: :destroy
  has_many :favorite_users, dependent: :destroy
  has_many :favorite_books, dependent: :destroy
  
end
