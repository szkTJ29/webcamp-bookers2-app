class BooksController < ApplicationController

  def create
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @user = current_user
    @users = User.all
    if @book.save
      flash[:create_book] = 'You have created book successfully.'
      redirect_to book_path(@book.id)
    else
      render :index
    end

  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
    @users = User.all

  end

  def show
    @bookshow = Book.find(params[:id])
    @book = Book.new
    @user = User.find(@bookshow.user_id)

  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path

  end

  def edit
    @book = Book.find(params[:id])
    if @book.user_id == current_user.id
      render :edit
    else
      redirect_to "/books"
    end

  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:update_book] = 'You have updated book successfully.'
      redirect_to book_path(@book.id)
    else
      render :edit
    end

  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
