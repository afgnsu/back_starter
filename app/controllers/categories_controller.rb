class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end
  
  def show
    @category = Category.includes(:projects).find_by(id: params[:id])
    @projects = @category.projects.order("created_at DESC")
  end
end
