class Public::BooksController < ApplicationController
  
  before_action :set_book_ranking, only: [:index]

  def index
    @genre = Genre.all
    @new_book = Book.all.order(created_at: :desc).limit(5)
  end
  
 
  
  def new
    @book = Book.new
    @classifications = Classification.all
    @genres = Genre.all
  end
  
  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to books_path
  end

  def show
    @book = Book.find(params[:id])
    @good_books = GoodBook.where(book_id: @book.id)
    @favorite_books = FavoriteBook.where(book_id: @book.id)
    @review = Review.new
    @reviews = @book.reviews.page(params[:page]).per(5).reverse_order
    if @book.reviews.blank?
      @average_rate = 0
    else
      @average_rate = @book.reviews.average(:rate).round(1)
    end
  end


  private

  def book_params
    params.require(:book).permit(:name, 
                                 :writer,
                                 :image,
                                 :edit_status,
                                 :is_active,
                                 :create_user,
                                 :classification_id,
                                 :genre_id,
                                 :created_at,
                                 :updated_at)
  end
  
  def review_params
    params.require(:review).permit(:comment,
                                   :rate,
                                   :is_active,
                                   :user_id,
                                   :book_id)
  end
  
  
  def set_book_ranking
        @ranking =[]
        @all_ranks = Book.find(GoodBook.group(:book_id).order('count(book_id) desc').limit(5).pluck(:book_id))
        @all_ranks.map do |book|
            @ranking.push(book.id)
        end
        
        @book_first = Book.find(@ranking[0])
        @book_second = Book.find(@ranking[1])
        @book_third = Book.find(@ranking[2])
        @book_fourth = Book.find(@ranking[3])
        @book_fifth = Book.find(@ranking[4])
        
        @rate =[]
        @all_ranks.map do |book|
          book_rate = Book.find(book.id)
          if book_rate.reviews.blank?
            @rate.push(0)
          else
            @rate.push(Book.find(book.id).reviews.average(:rate).round(1))
          end
        end
        
        @first_rate = @rate[0]
        @second_rate = @rate[1]
        @third_rate = @rate[2]
        @fourth_rate = @rate[3]
        @fifth_rate = @rate[4]
    end
    
end


