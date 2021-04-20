class Public::BooksController < ApplicationController
  
  before_action :set_book_ranking, only: [:index]

  def index
    @genre = Classification.all
    @relationships = Relationship.all
    @new_book = Book.all.order(created_at: :desc).limit(5)
    @q = Book.ransack(params[:q])
    @books = @q.result(distinct: true)
  end
  
  def search
    @q = Book.search(search_params)
    @books = @q.result(distinct: true)
  end
  
  def book_genres
    @genre = Genre.find(params[:id])
    @books = @genre.book.all
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
  
  def update
    @book = Book.find(params[:id])
    @book.update(is_active: "false")
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
  
  def search_params
    params.require(:q).permit(:name_cont)
  end
  
  
  def set_book_ranking
      @ranking =[]
      @all_ranks = Book.includes(:good_books).sort {|a,b| b.good_books.size <=> a.good_books.size}
      @all_ranks.last(5).map do |book|
          @ranking.push(book.id)
      end
      
      
      @book_first = Book.find(@ranking[0]) if @ranking[0] != nil
      @book_second = Book.find(@ranking[1]) if @ranking[1] != nil
      @book_third = Book.find(@ranking[2]) if @ranking[2] != nil
      @book_fourth = Book.find(@ranking[3]) if @ranking[3] != nil
      @book_fifth = Book.find(@ranking[4])if @ranking[4] != nil

      @rate =[]
      @all_ranks.map do |book|
        book_rate = Book.find(book.id)
        if book_rate.reviews.blank?
          @rate.push(0)
        else
          @rate.push(Book.find(book.id).reviews.average(:rate).round(1))
        end
      end
      
      @first_rate = @rate[0] if @rate[0] != nil
      @second_rate = @rate[1] if @rate[1] != nil
      @third_rate = @rate[2] if @rate[2] != nil
      @fourth_rate = @rate[3] if @rate[3] != nil
      @fifth_rate = @rate[4] if @rate[4] != nil
  end
    
end

