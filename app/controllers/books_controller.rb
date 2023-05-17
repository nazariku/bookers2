class BooksController < ApplicationController
  def new
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    #findメソッドは引数を受け取り、idカラムを引数と比べてレコードを取得してくるメソッド
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice]="Book was successfully created."
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def update
     @book = Book.find(params[:id])
     if @book.update(book_params)
       flash[:notice]="Book was successfully updated."
       redirect_to book_path(@book.id)
     else
       render :edit
     end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private
  #ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end