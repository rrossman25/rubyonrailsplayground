class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]


  # show list of articles
  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end
  # show individual article
  def show
  end
  # show form for new article
  def new
    @article = Article.new
  end
  # edit an article
  def edit
  end
  # create a new article in db
  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:notice] = "article created successfully"
      redirect_to @article
    else
      render 'new'
    end
  end
  
  # update the article in db
  def update
    if @article.update(article_params)
      flash[:notice] = "article updated successfully"
      redirect_to @article
    else
      render 'edit'
    end
  end

  # destroy the article in db
  def destroy
    @article.destroy
    flash[:notice] = "article deleted successfully"
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def require_same_user
    if current_user != @article.user_id
      flash[:alert] = "you can only edit your own article"
      redirect_to @article
    end
  end
end
