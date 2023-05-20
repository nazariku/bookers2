class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end
  
  def index
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
   user = User.create(user_params)
   redirect_to user_path(user.id)
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)#ストロングパラメータ、userモデルのname,profileのカラムの保存を許可する
    redirect_to user_path(user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)#ストロングパラメータ、userモデルのname,profileのカラムの保存を許可する
  end
end