class FeedbacksController < ApplicationController
  before_action :authenticate_user! # 添加用户鉴权（即登录才可以参与发表意见反馈）
  before_action :set_feedback, only: [:destroy]

  # GET /feedbacks
  # GET /feedbacks.json
  # 获取所有意见反馈的方法
  def index
    @feedbacks = Feedback.all # 获取所有意见反馈
    @user_name = current_user.username # 获取当前登录用户的用户名username
  end

  # GET /feedbacks/new
  # 新建意见反馈的方法
  def new
    @feedback = Feedback.new # 新建意见反馈对象
  end

  # POST /feedbacks
  # POST /feedbacks.json
  def create
    @feedback = Feedback.new(feedback_params) # 获取view页面传的feedback_params参数创建意见反馈
    respond_to do |format| # 处理表单方法
      if @feedback.save # 保存
        format.html { redirect_to feedbacks_url, notice: 'Feedback was successfully created.' } # 保存成功，跳转到意见反馈列表页面
      else
        format.html { render :new } # 保存失败，跳转到填写意见反馈的页面
      end
    end
  end

  # DELETE /feedbacks/1
  # DELETE /feedbacks/1.json
  # 删除方法
  def destroy
    @feedback.destroy # 删除选中的意见反馈内容
    respond_to do |format|
      format.html { redirect_to feedbacks_url, notice: 'Feedback was successfully destroyed.' } # 删除成功，跳转到意见反馈列表页面
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_feedback
    @feedback = Feedback.find(params[:id]) # 获取选中的内容，用于删除操作
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def feedback_params
    params.require(:feedback).permit(:content) # 获取填写的意见反馈内容。
  end
end
