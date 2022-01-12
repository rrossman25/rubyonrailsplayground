class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update]
  
  def new
    @user = User.new
  end

  # show list of users
  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end
  
  def show
    @articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def edit
  end

   # update the article in db
  def update
    if @user.update(user_params)
      flash[:notice] = "User settings updated successfully"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "welcome, #{@user.username}, you have successfully signed in"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
