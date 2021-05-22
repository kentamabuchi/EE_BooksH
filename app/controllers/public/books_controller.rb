class Public::BooksController < ApplicationController
  
  before_action :set_book_ranking, only: [:index]
  before_action :set_classification_ranking, only: [:book_classifications]
  before_action :set_follow_book_ranking, only: [:index]

  def index
    @classifications = Classification.all
    @relationships = Relationship.all
    @q = Book.ransack(params[:q])
    @books = @q.result(distinct: true)
  end
  
  def search
    @keywords = params[:keyword]
    @search_books = []
    @keywords.split(/[[:blank:]]+/).each do |keyword|
      next if keyword == ""
      @search_books += Book.where('name LIKE(?) OR writer LIKE(?)', "%#{keyword}%", "%#{keyword}%")
    end
    @search_books.uniq!
    @books = Kaminari.paginate_array(@search_books).page(params[:page]).per(10)
  end
  
  def book_classifications
  end

  def new
    @book = Book.new
    @classifications = Classification.all
    @genres = Genre.all
  end
  
  def create
    @book = Book.new(book_params)
    @classifications = Classification.all
    @genres = Genre.all
    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  def show
    @book = Book.find(params[:id])
    @good_books = GoodBook.where(book_id: @book.id)
    @favorite_books = FavoriteBook.where(book_id: @book.id)
    @review = Review.new
    @reviews = @book.reviews.page(params[:page]).per(5).reverse_order
    if @book.reviews.blank?
      @average_rate = 0
    else
      @average_rate = @book.reviews.average(:rate).round(1)
    end
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(is_active: "false")
  end
  
  def change
    @review_violation = Review.find(params[:id])
    @review_violation.update(is_active: "false")
  end
    


  private

  def book_params
    params.require(:book).permit(:name, 
                                 :writer,
                                 :image,
                                 :introduction,
                                 :edit_status,
                                 :is_active,
                                 :create_user,
                                 :classification_id,
                                 :genre_id,
                                 :created_at,
                                 :updated_at)
  end
  
  def review_params
    params.require(:review).permit(:comment,
                                   :rate,
                                   :is_active,
                                   :user_id,
                                   :book_id)
  end
  
  def search_params
    params.require(:q).permit(:name_cont)
  end
  
  def set_follow_book_ranking
    @followings = current_user.followings
    @users = []
    @followings.map do |following|
      @users.push(User.find(following.id))
    end
    @books = []
    @users.map do |user|
      user.favorite_books.map do |favorite_book|
        @b = FavoriteBook.find_by(user_id: current_user.id, book_id: favorite_book.book.id)
        if @b.blank?
        @books.push(Book.find(favorite_book.book.id))
        end
      end
    end
    @follow_books =  @books.sample(8).uniq
  end

  def set_book_ranking
    @new_books = Book.all.order(created_at: :desc).limit(5)
    @rankings = []
    @all_ranks = Book.includes(:favorite_books).sort {|a,b| b.favorite_books.size <=> a.favorite_books.size}
    @all_ranks.last(5).map do |book|
      @rankings.push(book.id)
    end
      
    @rate =[]
    @all_ranks.last(5).map do |book|
      book_rate = Book.find(book.id)
      if book_rate.reviews.blank?
        @rate.push(0)
      else
        @rate.push(Book.find(book.id).reviews.average(:rate).round(1))
      end
    end
    
    @first_rate = @rate[0] if @rate[0] != nil
    @second_rate = @rate[1] if @rate[1] != nil
    @third_rate = @rate[2] if @rate[2] != nil
    @fourth_rate = @rate[3] if @rate[3] != nil
    @fifth_rate = @rate[4] if @rate[4] != nil
  end
    
  def set_classification_ranking
    @classification = Classification.find(params[:id])
    @new_classification_books = @classification.books.all.order(created_at: :desc).limit(5)
    @classification_rankings = []
    @all_ranks = Book.includes(:good_books).sort {|a,b| b.good_books.size <=> a.good_books.size}
    @classification_ranks = @all_ranks.select{ |book| book.classification_id == @classification.id }
    @classification_ranks.last(5).map do |book|
      @classification_rankings.push(book.id)
    end
    
  end
  
end

