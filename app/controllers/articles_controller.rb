class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  # show list of articles
  def index
    @articles = Article.all
  end
  # show individual article
  def show
    # byebug
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
    @article.user = User.first
    if @article.save
      flash[:notice] = "Article created successfully"
      redirect_to @article
    else
      render 'new'
    end
  end
  
  # update the article in db
  def update
    if @article.update(article_params)
      flash[:notice] = "Article updated successfully"
      redirect_to @article
    else
      render 'edit'
    end
  end

  # destroy the article in db
  def destroy
    @article.destroy
    flash[:notice] = "Article deleted successfully"
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
