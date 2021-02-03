class BooksController < ApplicationController

# 一覧画面+新期投稿
  def index
    @books = Book.all
    @book = Book.new
  end
  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was succesfully created."
      redirect_to book_path(@book)
    else
      @books = Book.all
      render action: :index
    end
  end

# 詳細画面
  def show
    @book = Book.find(params[:id])
  end

# 編集
  def edit
    @book = Book.find(params[:id])
  end
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was succesfully updated"
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

# 削除
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
