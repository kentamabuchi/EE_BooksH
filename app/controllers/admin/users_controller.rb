class Admin::UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(10).reverse_order
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admin_user_path(@user)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:nick_name, 
                                 :email,
                                 :image,
                                 :introduce,
                                 :is_active,
                                 :created_at,
                                 :updated_at)
  end
  
end
