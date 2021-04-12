class Public::UsersController < ApplicationController
  
  def show
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(current_user.id)
  end
  
  def update
    @user = User.find(current_user.id)
    @user.update(user_params)
    redirect_to mypage_path
  end

  def status
  end
  
  def change
    @user = User.find(current_user.id)
    @user.update(is_active: "false")
    reset_session
    redirect_to root_path
  end
    
  
  private
  
  def user_params
    params.require(:user).permit(:nick_name, 
                                 :email,
                                 :image,
                                 :is_active,
                                 :created_at,
                                 :updated_at)
  end
  
end
