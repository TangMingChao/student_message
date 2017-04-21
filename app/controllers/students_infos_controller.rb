class StudentsInfosController < ApplicationController
  before_action :authenticate_user! # 添加用户鉴权（即登录才可以查看学生信息）
  before_action :set_students_info, only: [:show, :edit, :update, :destroy]

  # GET /students_infos
  # GET /students_infos.json
  def index
    @students_infos = StudentsInfo.all # 获取所以学生信息内容
  end

  # GET /students_infos/new
  def new
    @students_info = StudentsInfo.new # 新建对象接收填写的学生信息
  end

  # POST /students_infos
  # POST /students_infos.json
  def create
    @students_info = StudentsInfo.new(students_info_params) # 接收填写的学生信息内容

    respond_to do |format|
      if @students_info.save # 保存学生信息
        format.html { redirect_to students_infos_url notice: 'Students info was successfully created.' } # 成功，跳转到学生信息列表页面
        # format.json { render :show, status: :created, location: @students_info }
      else
        format.html { render :new } # 失败，跳转到填写学生信息的页面
        # format.json { render json: @students_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students_infos/1
  # PATCH/PUT /students_infos/1.json
  def update
    respond_to do |format|
      if @students_info.update(students_info_params) # 修改学生休息
        format.html { redirect_to @students_info, notice: 'Students info was successfully updated.' } # 成功，跳转到学生信息列表页面
        # format.json { render :show, status: :ok, location: @students_info }
      else
        format.html { render :edit } # 失败，跳转到修改页面，
        # format.json { render json: @students_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students_infos/1
  # DELETE /students_infos/1.json
  def destroy
    @students_info.destroy # 删除选中的学生信息内容
    respond_to do |format|
      format.html { redirect_to students_infos_url, notice: 'Students info was successfully destroyed.' } # 删除成功，跳转到学生信息列表页面
      # format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_students_info
    @students_info = StudentsInfo.find(params[:id]) # 获取选中的内容，用于修改或者删除操作
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def students_info_params
    params.require(:students_info).permit(:name, :sex, :number, :phone, :picture, :age, :email, :sign, :qq, :address)#接收填写的学生信息内容
  end
end
