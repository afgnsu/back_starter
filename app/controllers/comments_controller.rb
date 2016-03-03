class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    project = Project.find_by(id: params[:project_id])
    @comment = Comment.new(comment_params)
    @comment.project = project
    @comment.save
    @new_counts = project.comments.count
    
    respond_to do |format|
      format.js
    end
  end
  
  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end
