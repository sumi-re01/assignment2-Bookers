class BooksController < ApplicationController

  # 一覧画面+新期投稿
  def index
    @books = Book.all
    @book = Book.new
  end
  def create
    book = Book.new(book_params)
    if book.save
      flash[:notice] = "Book was succesfully created."
      redirect_to books_path
    else
      redirect_to books_path
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:notice] = "Book was succesfully updated"
      redirect_to book_path(book)
    else
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book was succesfully destroyed"
    redirect_to books_path
  end


  # ↓params
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
