class UsersController < ApplicationController
  def new
    @user = User.new
  end

  # show list of users
  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end
  
  def show
    @user = User.find(params[:id])
    @articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def edit
    @user = User.find(params[:id])
  end

   # update the article in db
  def update
    @user = User.find(params[:id])
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
      flash[:notice] = "Welcome, #{@user.username}, you have successfully signed in"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
