class Public::GoodBooksController < ApplicationController
    
    before_action :set_book
    
    def create
        @good_book = current_user.good_books.new(book_id: params[:book_id])
        @good_book.save
    end
    
    def destroy
        @good_book = GoodBook.find_by(book_id: @book.id, user_id: current_user.id).destroy
    end
    
    private
    
    def good_book_params
        params.require(:good_book).permit.(:user_id,
                                           :book_id,
                                           :created_at,
                                           :updated_at)
    end
    
    def set_book
        @book = Book.find(params[:book_id])
    end
    
end
