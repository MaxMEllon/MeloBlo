class CategoriesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :cleate, :destroy] # 閲覧制限
  before_action :set_category, only: [:show]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def show
    @blogs = @category.blogs
  end

  def destroy
  end

  private
    def category_params
      params[:category].permit(:name)
    end

    def set_category
      @category = Category.find(params[:id])
    end
end
