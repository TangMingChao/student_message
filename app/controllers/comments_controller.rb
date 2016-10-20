class CommentsController < ApplicationController
  before_action :authenticate_user!
 def create
  
    @students_forum = StudentsForum.find(params[:students_forum_id])
    @comment = @students_forum.comments.create(comment_params)

    # @comment.user_id = current_user.id
    redirect_to students_forum_path(@students_forum)
  end

  private
    
    def comment_params
      params.require(:comment).permit(:content)
    end
end
