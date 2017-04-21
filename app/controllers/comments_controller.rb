class CommentsController < ApplicationController
  before_action :authenticate_user! # 添加用户鉴权（即登录才可以参与评论）

  # 新建评论的方法
  def create
    @students_forum = StudentsForum.find(params[:students_forum_id]) # 获取需要评论的话题
    @comment = @students_forum.comments.create(comment_params) # 对获取的话题创建评论
    # @comment.user_id = current_user.id  #评论是当前登录的用户创建的
    redirect_to students_forum_path(@students_forum) # 评论创建后跳转到话题论坛页面
  end

  private

  def comment_params # 获取评论的参数方法
    params.require(:comment).permit(:content) # 评论comment只有一个内容content参数
  end
end
