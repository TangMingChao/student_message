class StudentsForumsController < ApplicationController
  before_action :authenticate_user! # 添加用户鉴权（即登录才可以参与学生论坛）
  before_action :set_students_forum, only: [:upvote, :show, :edit, :update, :destroy]

  # ###############点赞方法#############
  def upvote
    @students_forum.votes.create # 给选中的论坛话题点赞操作
    redirect_to students_forums_url # 点赞成功，跳转到论坛列表页面
  end

  # GET /students_forums
  # GET /students_forums.json
  def index
    @students_forums = StudentsForum.all # 获取所以的论坛话题内容
  end

  # GET /students_forums/1
  # GET /students_forums/1.json
  def show
    @user_name = current_user.email # 获取当前登录用户的Emai
  end

  # GET /students_forums/new
  def new
    @students_forum = StudentsForum.new # 创建接收 填写论坛话题内容的对象
  end

  # GET /students_forums/1/edit
  def edit; end

  # POST /students_forums
  # POST /students_forums.json
  def create
    @students_forum = StudentsForum.new(students_forum_params) # 接收论坛话题内容

    respond_to do |format|
      if @students_forum.save # 保存论坛话题内容
        format.html { redirect_to students_forums_url, notice: 'Students forum was successfully created.' } # 成功，跳转到论坛话题列表页面
        # format.json { render :show, status: :created, location: @students_forum }
      else
        format.html { render :new } # 失败，跳转到填写论坛话题内容的页面
        # format.json { render json: @students_forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students_forums/1
  # PATCH/PUT /students_forums/1.json
  def update
    respond_to do |format|
      if @students_forum.update(students_forum_params) # 修改论坛话题内容
        format.html { redirect_to @students_forum, notice: 'Students forum was successfully updated.' } # 成功，跳转到论坛话题列表页面，
        # format.json { render :show, status: :ok, location: @students_forum }
      else
        format.html { render :edit } # 失败，跳转到修改论坛话题内容页面，
        # format.json { render json: @students_forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students_forums/1
  # DELETE /students_forums/1.json
  def destroy
    @students_forum.destroy # 删除选中的论坛话题内容
    respond_to do |format|
      format.html { redirect_to students_forums_url, notice: 'Students forum was successfully destroyed.' } # 删除成，跳转到论坛话题列表页面
      # format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_students_forum
    @students_forum = StudentsForum.find(params[:id]) # 获取选中的论坛话题内容
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def students_forum_params
    params.require(:students_forum).permit(:title, :description) # 接收填写的论坛话题内容
  end
end
