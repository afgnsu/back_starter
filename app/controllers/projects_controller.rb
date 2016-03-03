class ProjectsController < ApplicationController
  def new
    @project = Project.new
    @categories = Category.all
  end
  
  def create
    
    if Project.exists?(url: params[:project][:url])
      @message = "Already existed" 
      return
    end
    
    @project = Project.new(link_params)
    if @project.add_project_information
      @project.save
      @message = "Successfully added"
    else
      @message = "Invalid URL" 
    end

    respond_to do |format|
      format.js
    end
    
  end
  
  private
    def link_params
      params.require(:project).permit(:url, :category_id)
    end  
end
