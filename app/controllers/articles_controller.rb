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

end
