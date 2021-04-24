class Public::RelationshipsController < ApplicationController
    
     before_action :set_user
    
    def create
        @relationship = current_user.relationships.new(follow_id: @user.id)
        @relationship.save
    end
    
    def destroy
        @relationship = Relationship.find_by(user_id: current_user.id, follow_id: @user.id).destroy
    end
    
    private
    
    def favorite_user_params
        params.require(:relationship).permit(:user_id,
                                              :follow_id,
                                              :created_at,
                                              :updated_at)
    end
    
    def set_user
        @user = User.find(params[:user_id])
    end
    
end
