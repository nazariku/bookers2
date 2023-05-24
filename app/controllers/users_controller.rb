class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def index
    @users = User.all
    @user = User.find(current_user.id)
    @books = @user.books
  end

  def edit
     user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user)
    end
     @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to books_path
    end
    @user = User.find(params[:id])
    if @user.update(user_params)#ストロングパラメータ、userモデルのname,profileのカラムの保存を許可する
      flash[:notice] = "successfully"
      redirect_to user_path(user.id)
    else
      flash[:alert] = "error"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)#ストロングパラメータ、userモデルのname,profileのカラムの保存を許可する
  end
end