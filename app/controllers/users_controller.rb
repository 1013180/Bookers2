class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:update, :edit]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new

  end

  def index
    @users = User.all
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  def show_follow
      @user  = User.find(params[:id])
      @users = @user.followings
      render 'show_follow'
  end

  def show_follower
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end


  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end


  def ensure_correct_user
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user)
    end
  end
end