class Admin::HomesController < ApplicationController
  
  def top
    @books =Book.where(is_active: true).page(params[:page]).per(5).reverse_order
  end
  
  def violation_books
    @books = Book.where(is_active: true).all
  end
  
  def violation_reviews
    @reviews = Review.all
  end
  
end
