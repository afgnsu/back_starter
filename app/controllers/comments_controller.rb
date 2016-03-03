class CommentsController < ApplicationController
  def create
    project = Project.find_by(params[:project_id])
    @comment = project.comments.create(comment_params)
    
    respond_to do |format|
      format.js
    end
  end
  
  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end
