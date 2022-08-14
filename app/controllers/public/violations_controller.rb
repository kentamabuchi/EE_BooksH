class Public::ViolationsController < ApplicationController


  def create
    @book = Book.find(params[:book_id])
    @violation = @book.violations.new(violation_params)
    @violation.user_id = current_user.id
    if @violation.save
      @book.update(is_active: "false")
      redirect_to book_path(@book)
    end
  end

  def destroy
  end

  private

  def violation_params
    params.require(:violation).permit(:comment,
                                      :is_active,
                                      :user_id,
                                      :book_id,
                                      :created_at,
                                      :updated_at)
  end
  def book_params
    params.require(:book).permit(:is_active,
                                 :updated_at)
  end


end
