class Public::ReviewsController < ApplicationController
    
    def create
        @book = Book.find(params[:book_id])
        @review = current_user.reviews.new(review_params)
        @review.book_id = @book.id
        @review.save
        redirect_to book_path(@book)
    end
    
    def destroy
        @review = Review.find_by(id: params[:id], book_id: params[:book_id])
        @review.destroy
        redirect_to book_path(params[:book_id])
    end
    
    private
    
    def review_params
        params.require(:review).permit(:comment,
                                       :rate,
                                       :is_active,
                                       :user_id,
                                       :book_id)
    end
    
end
