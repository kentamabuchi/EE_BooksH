class Admin::BooksController < ApplicationController
  
  def index
    @books = Book.all
  end

  def new
    @book =Book.new
    @classifications = Classification.all
    @genres = Genre.all
  end
  
  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to admin_books_path
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    @classifications = Classification.all
    @genres = Genre.all
  end
  
  def update
    @book = Book.find(params[:id])
    if params[:book][:edit_option] == "0"
      @book.edit_status = true
    elsif params[:book][:edit_option] == "1"
      @book.edit_status = false
    end
    if params[:book][:book_option] == "0"
      @book.is_active = true
    elsif params[:book][:book_option] == "1"
      @book.is_active = false
    end
    @book.update(book_params)
    redirect_to admin_book_path(@book)
  end
    
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to admin_books_path
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
  
end
