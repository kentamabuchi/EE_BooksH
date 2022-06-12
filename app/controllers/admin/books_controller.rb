class Admin::BooksController < ApplicationController
  

  def index
    @books = Book.page(params[:page]).per(10).reverse_order
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
    @link = session[:link]
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    @classifications = Classification.all
    @genres = Genre.all
    session[:link] = request.referer
  end
  
  def update
    @book = Book.find(params[:id])
    update_params = book_params

    if params[:book][:edit_option] == "0"
      update_params[:edit_status] = "true"
    elsif params[:book][:edit_option] == "1"
      update_params[:edit_status] = "false"
    end

    if params[:book][:book_option] == "0"
      update_params[:is_active] = "true"
    elsif params[:book][:book_option] == "1"
      update_params[:is_active] = "false"
    end

    @book.update(update_params)
    if session[:link].present? and session[:link].include?('top')
      session[:link] = "1"
      redirect_to admin_book_path(@book)
    else
      session[:link] = "2"
      redirect_to admin_book_path(@book)
    end
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
                                 :introduction,
                                 :is_active,
                                 :create_user,
                                 :classification_id,
                                 :genre_id,
                                 :created_at,
                                 :updated_at)
  end

end
