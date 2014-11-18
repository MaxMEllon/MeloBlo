class CategoriesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :cleate, :destroy] # 閲覧制限

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
