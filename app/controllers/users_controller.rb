class UsersController < ApplicationController
before_action :authenticate_user!


  def show
  	@user = User.find(params[:id])
    @books = Book.where(user_id: params[:id])
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  if @user != current_user
    redirect_to user_path(current_user)
   end
  end

  def index

    @book=Book.new
    @users = User.all
    @book.user_id = current_user.id
  end


  def update
  @user = User.find(params[:id])
  if @user.update(user_params)
    flash[:notice]='You have updated user successfully.'
    redirect_to user_path(@user.id)
  else
    render :edit
  end
  end


def create
    @book=Book.new(book_params)
    if @book.save
    flash[:notice]='You have updated user successfully.'
    redirect_to books_show_path(@book.id)
   else
    @books = Book.all
    render :show
   end
  end


private
def user_params
  params.require(:user).permit(:name, :profile_image, :introduction)

end

end
