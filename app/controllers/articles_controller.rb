class ArticlesController < ApplicationController
  # show list of articles
  def index
    @articles = Article.all
  end
  # show individual article
  def show
    # byebug
    @article = Article.find(params[:id])
  end
  # show form for new article
  def new
    @article = Article.new
  end
  # edit an article
  def edit
    @article = Article.find(params[:id])
  end
  # create a new article in db
  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save
      flash[:notice] = "Article created successfully"
      redirect_to @article
    else
      render 'new'
    end
  end
  
  # update the article in db
  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article updated successfully"
      redirect_to @article
    else
      render 'edit'
    end
  end

  # destroy the article in db
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Article deleted successfully"
    redirect_to articles_path
  end
end
