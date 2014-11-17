class ArticlesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :cleate] # 閲覧制限

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to blogs_path
    else
      render "new"
    end
  end

  private
    def article_params
      params[:article].permit(:title, :content)
    end
end
