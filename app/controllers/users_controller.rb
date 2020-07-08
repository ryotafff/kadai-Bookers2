class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
    @books = Book.all
    @book=Book.new
  end

  def edit
    @user = User.find(params[:id])

  end

  def index
    @user=current_user
    @book=Book.new
  end


  def update
  @user = User.find(params[:id])
  @user.update(user_params)
  redirect_to user_path(@user.id)
  end


def create
    @book=Book.new(book_params)
    if @book.save
    flash[:notice]='Book was successfully updated.'
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
