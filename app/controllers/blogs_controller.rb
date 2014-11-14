class BlogsController < ApplicationController

  # before_action :authenticate_user!, only: [] # 閲覧制限

  def index
    @blogs = Blog.all
    @articles = Article.all
  end
end
