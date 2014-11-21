class ArticlesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :cleate] # 閲覧制限
  before_action :set_blog, only: [:new, :create]
  before_action :set_article, only: [:edit, :destroy, :update, :edit]

  def new
    @article = @blog.articles.new
  end

  def create
    @article = @blog.articles.create(article_params)
    if @article.save
      redirect_to root_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to blog_path(@article.blog_id)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
  end

  private
    def article_params
      params[:article].permit(:title, :tag_list, :content)
    end

    def set_blog
      @blog = Blog.find(params[:blog_id])
    end

    def set_article
      @article = Article.find(params[:id])
    end
end
