class ProjectsController < ApplicationController
  def new
    @project = Project.new
    @categories = Category.all
  end
  
  def create
    @project = Project.new(link_params)
    @project.add_project_information
    @project.save

    respond_to do |format|
      format.js
    end
  end
  
  private
    def link_params
      params.require(:project).permit(:url, :category_id)
    end  
end
