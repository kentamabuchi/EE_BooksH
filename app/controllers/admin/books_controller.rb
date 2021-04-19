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
    
    update_params = book_params

    if params[:book][:edit_option] == "0"
      update_params[:edit_status] = "未編集"
    elsif params[:book][:edit_option] == "1"
      update_params[:edit_status] = "編集済み"
    end

    if params[:book][:book_option] == "0"
      update_params[:is_active] = "正常"
    elsif params[:book][:book_option] == "1"
      update_params[:is_active] = "違反"
    end

    @book.update(update_params)
    
    redirect_to admin_book_path(@book)
  end
    
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to admin_top_path
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
