class Public::FavoriteUsersController < ApplicationController
    
    before_action :set_user
    
    def create
        @favorite_user = current_user.favorite_users.new(favorite_user_id: @user.id)
        @favorite_user.save
    end
    
    def destroy
        @favorite_user = FavoriteUser.find_by(user_id: current_user.id, favorite_user_id: @user.id).destroy
    end
    
    private
    
    def favorite_user_params
        params.require(:favorite_user).permit(:user_id,
                                              :favorite_user_id,
                                              :created_at,
                                              :updated_at)
    end
    
    def set_user
        @user = User.find(params[:user_id])
    end
    
end    
