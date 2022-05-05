class Public::BooksController < ApplicationController
  
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_book_ranking, only: [:index]
  before_action :set_classification_ranking, only: [:book_classifications]
  before_action :set_follow_book_ranking, only: [:index], if: :user_signed_in?

  def index
    @classifications = Classification.all
    @relationships = Relationship.all
    @recomened_books = @all_ranks.sample(5)
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
      @average_rate = @reviews.average(:rate).round(1)
    end
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(is_active: "false")
  end
  
  def change
    @review = Review.find(params[:id])
    @review.update(is_active: "false")
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
    @books.uniq!
    @follow_books =  @books.sample(5)
  end

  def set_book_ranking
    @new_books = Book.all.order(created_at: :desc).limit(5)
    @rankings = []
    @all_ranks = Book.includes(:favorite_books).sort {|a,b| b.favorite_books.size <=> a.favorite_books.size}
  end
    
  def set_classification_ranking
    @classification = Classification.find(params[:id])
    @new_classification_books = @classification.books.all.order(created_at: :desc).limit(5)
    @classification_rankings = []
    @all_ranks = Book.includes(:favorite_books).sort {|a,b| b.favorite_books.size <=> a.favorite_books.size}
    @classification_ranks = @all_ranks.select{ |book| book.classification_id == @classification.id }
  end
  
end

