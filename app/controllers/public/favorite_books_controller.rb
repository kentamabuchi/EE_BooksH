class Public::FavoriteBooksController < ApplicationController
    
     before_action :set_book
    
    def create
        @favorite_book = current_user.favorite_books.new(book_id: params[:book_id])
        @favorite_book.save
    end
    
    def destroy
        @favorite_book = FavoriteBook.find_by(book_id: @book.id, user_id: current_user.id).destroy
    end
    
    private
    
    def favorite_book_params
        params.require(:favorite_book).permit.(:user_id,
                                               :book_id,
                                               :created_at,
                                               :updated_at)
    end
    
    def set_book
        @book = Book.find(params[:book_id])
    end
   
    
end
