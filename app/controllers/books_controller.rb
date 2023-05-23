class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
    @user = User.find(current_user.id)
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "successfully"
      redirect_to book_path(@book)
    else
      flash.now[:alert] = "error"
      @user = current_user
      render :index
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)#ストロングパラメータ、userモデルのname,profileのカラムの保存を許可する
       flash[:notice] = "successfully"
       redirect_to book_path(book_params)
    else
      flash.now[:alert] = "error"
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end