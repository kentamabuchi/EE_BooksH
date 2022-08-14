class Admin::HomesController < ApplicationController
  
  def top
    @books =Book.where(is_active: false).all
  end
  
  def violation_books
    @books = Book.where(is_active: false).all
    session[:return] = "1"
  end
  
  def violation_reviews
    @reviews = Review.where(is_active: false).all
  end
  
end
