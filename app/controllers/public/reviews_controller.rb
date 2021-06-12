class Public::ReviewsController < ApplicationController
    
    def index
        @return_comment = current_user.return_comments.new
        @followings = current_user.followings
        @all_reviews = Review.all_reviews(@followings, current_user).sort{ |a,b| a.updated_at <=> b.updated_at}.reverse
        @reviews = Kaminari.paginate_array(@all_reviews).page(params[:page]).per(10)
        
    end
    
    def show
        @review = Review.find(params[:id])
        @return_comment = current_user.return_comments.new
        @return_comments = @review.return_comments.page(params[:page]).per(5).reverse_order
    end
    
    def create
        @book = Book.find(params[:book_id])
        @review = current_user.reviews.new(review_params)
        @review.book_id = @book.id
        if @review.rate.nil?
            @review.rate = 0
        end
        @review.save
        redirect_to book_path(@book)
    end
    
    def destroy
        @review = Review.find_by(id: params[:id], book_id: params[:book_id])
        @review.destroy
        if params[:link] == "2"
            redirect_to reviews_path
        else
            redirect_to book_path(params[:book_id])
        end
    end
    
    def update
        @review = Review.find(params[:id])
        @review.update(is_active: "false")
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
