class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :update, :destroy, :like]
  before_action :authenticate_user!, except: [:show, :search]
  before_action :admin_user?, except: [:show, :favorite, :like, :search]
  
  def new
    @project = Project.new
    @categories = Category.all
  end
  
  def favorite 
    @projects = current_user.projects
  end
  
  def search
    if params[:search_content].blank?
      @projects = [] and return
    end
    
    @search_content = params[:search_content]
    @projects = Project.search(params[:search_content]).order('updated_at DESC')  
    
  end

  def create
    
    if Project.exists?(url: params[:project][:url])
      @message = "Already existed" 
      return
    end
    
    @project = Project.new(project_params)
    if @project.add_project_information
      if @project.save
        @message = "Successfully added"
      else
        @message = "Wrong data"  
      end
    else
      @message = "Invalid URL" 
    end

    respond_to do |format|
      format.js
    end
    
  end
  
  def like
    if @project.like_by_user? current_user
      current_user.projects.delete(@project)
      @like = false
    else
      current_user.projects << @project 
      @like = true
    end
    
    
    respond_to do |format|
      format.js
    end
    
  end
  
  def show
    if user_signed_in?
      @like = @project.like_by_user? current_user
    end
    @comments = @project.comments.order("created_at DESC")
    @comment = @project.comments.new
  end
  
  def edit
    @categories = Category.all
  end
  
  def update
    if @project.update(project_params)
      redirect_to project_path(@project) 
    else
      render 'edit'
    end
  end
  
  def destroy
    @project.destroy
    redirect_to root_path
  end
  
  
  private
    def project_params
      params.require(:project).permit(:url, :category_id, :description, :title, :cover)
    end  
  
    def find_project
      @project = Project.find_by(id: params[:id])
    end
    
    def admin_user?
      if !current_user.admin
        redirect_to root_path
      end
    end    
end
