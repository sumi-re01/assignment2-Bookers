class BooksController < ApplicationController

  # 一覧画面+新期投稿
  def index
    @books = Book.all
    @book = Book.new
  end
  def create
    book = Book.new(book_params)
    book.save
    redirect_to books_path
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
  end
  def update
  end

  def destroy
  end


  # ↓params
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
