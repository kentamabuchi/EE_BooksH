class Public::ReturnCommentsController < ApplicationController
    
    def create
        @review = Review.find(params[:review_id])
        @return_comment = current_user.return_comments.new(return_comment_params)
        @return_comment.review_id = params[:review_id]
        @return_comment.save
        @review.updated_at = @return_comment.updated_at
        @review.save
        redirect_to review_path(params[:review_id])
    end
    
    def destroy
        @return_comment = ReturnComment.find(params[:id])
        @return_comment.destroy
        redirect_to review_path(params[:review_id])
    end
    
    private
    
    def return_comment_params
         params.require(:return_comment).permit(:user_id,
                                                :review_id,
                                                :comment,
                                                :created_at,
                                                :updated_at)
    end
    
    def review_params
        params.require(:review).permit(:comment,
                                       :rate,
                                       :is_active,
                                       :user_id,
                                       :book_id,
                                       :created_at,
                                       :updated_at)
    end
    
end
