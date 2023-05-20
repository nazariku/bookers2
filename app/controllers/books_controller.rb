class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)#ストロングパラメータ、userモデルのname,profileのカラムの保存を許可する
    redirect_to user_path(user.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to user_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end