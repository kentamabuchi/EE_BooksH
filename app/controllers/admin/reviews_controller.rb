class Admin::ReviewsController < ApplicationController
    def show
        @review = Review.find(params[:id])
    end
    
    def edit
        @review = Review.find(params[:id])
    end
    
    def update
        @review = Review.find(params[:id])
        @review.update
        redirect_to admin_review_path
    end
    
    def destroy
        @review = Review.find(params[:id])
        @review.destroy
        redirect_back(fallback_location: admin_top_path)
    end
    
end
