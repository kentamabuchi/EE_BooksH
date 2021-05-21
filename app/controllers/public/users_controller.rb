class Public::UsersController < ApplicationController
  
  def mypage
    @user = User.find(current_user.id)
    @favorite_books = current_user.favorite_books.limit(5).reverse_order
    @relationships = current_user.followings.limit(5).reverse_order
  end
  
  def show
    @user = User.find(params[:id])
    @favorite_books = @user.favorite_books.all
    @relationships = @user.followings.all
    if @user == current_user
      redirect_to mypage_path
    end
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
  
  def favorites
    @user = User.find(params[:id])
    @favorite_books = @user.favorite_books.all
  end
  
  def relationships
    @user = User.find(params[:id])
    @relationships = @user.followings.all
  end
  
  def favorite_books
    @user = User.find(params[:id])
    @favorite_books = @user.favorite_books.page(params[:page]).per(10).reverse_order
  end
  
  def followers
    @user = User.find(params[:id])
    @relationships = @user.followings.page(params[:page]).per(10).reverse_order
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

