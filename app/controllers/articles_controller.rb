class ArticlesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :cleate] # 閲覧制限
  before_action :set_blog, only: [:new, :create]

  def new
    @article = @blog.articles.new
  end

  def create
    @article = @blog.articles.create(article_params)
    if @article.save
      redirect_to blogs_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  private
    def article_params
      params[:article].permit(:title, :content, :tag_ids => [])
    end

    def set_blog
      @blog = Blog.find(params[:blog_id])
    end

    def set_article
      @article = Article.find(params[:id])
    end
end
