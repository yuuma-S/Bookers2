class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

  def index
  	@users = User.all
    @book = Book.new
    @books = Book.all
  end

  def new
  	@user = User.find(params[:id])
  end

  def show
    @users = User.all
  	@user = User.find(params[:id])
    @book = Book.new

  end

  def edit
  	@user = User.find(params[:id])
    @book = Book.new

  end

  def update
	  @user = User.find(params[:id])
	  if  @user.update(users_params)
	      redirect_to user_path
        flash[:notice] = "successfully"
    else
        @book = Book.new
        render :edit
    end
  end

  def destroy
  	user = User.find(params[:id])
  	user.destroy
  	redirect_to users_path
  end

  def follows
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end



  private
  def users_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end
  def correct_user
    user = User.find(params[:id])
    if current_user != user
    redirect_to user_path(current_user)
    end
  end
end
