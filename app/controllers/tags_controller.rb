class TagsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :cleate, :destroy] # 閲覧制限

  def index
    @tags = tag.all
  end

  def new
    @tag = tag.new
  end

  def create
    @tag = tag.new(tag_params)
    if @tag.save
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
    def tag_params
      params[:tag].permit(:name)
    end

end
