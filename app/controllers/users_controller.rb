class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
    @book = Book.new

  end

  def index
    @user = current_user
    @book = Book.new
    @users = User.all

  end

  def edit
      user = User.find(params[:id])
    if user == current_user
      @user = User.find(params[:id])
      render :edit
    else
      @user = current_user
      redirect_to user_path(@user.id)
    end

  end

  def update
    @book = Book.new
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:update_user] = 'You have updated user successfully.'
      redirect_to user_path(@user.id)
    else
      render :edit
    end

  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
