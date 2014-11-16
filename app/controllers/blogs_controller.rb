class BlogsController < ApplicationController

  before_action :authenticate_user!, only: [:new] # 閲覧制限
  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blogs_path
    else
      render 'new'
    end
  end

  def index
    @blogs = Blog.all
    @articles = Article.all
  end

  private
    def blog_params
      params[:blog].permit(:title, :user_id)
    end
end
