class BlogsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy] # 閲覧制限
  before_action :set_user, only: [:new, :create, :destroy, :edit]
  before_action :set_blog, only: [:show]

  def index
    @blogs = Blog.all
    @articles = Article.all
  end

  def new
    @categories = Category.all
    @blog = @user.build_blog
  end

  def create
    @blog = @user.build_blog(blog_params)
    if @blog.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def show
    @articles = @blog.articles
  end

  def destroy
    @blog.articles.destroy_all
    @blog.destroy
    redirect_to root_path
  end

  private
    def blog_params
      params[:blog].permit(:title, :category_ids => [] )
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def set_blog
      @blog = Blog.find(params[:id])
    end
end
