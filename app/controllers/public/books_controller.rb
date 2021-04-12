class Public::BooksController < ApplicationController
  def index
    @books = Book.all
    @genre = Genre.all
  end

  def show
  end

  def edit
  end
end
