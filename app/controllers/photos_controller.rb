class PhotosController < ApplicationController
  before_action :authenticate_user!#添加用户鉴权（即登录才可以查看相册内容）
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  # GET /photos
  # GET /photos.json
  def index
    @photos = Photo.all #获取所有相册内容
  end

  # # GET /photos/1
  # # GET /photos/1.json
  # def show
  # end

  # GET /photos/new
  def new
    @photo = Photo.new #上传图片到相册
  end

  # # GET /photos/1/edit
  # def edit
  # end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(photo_params) #接收view传的图片

    respond_to do |format|
      if @photo.save #保存图片到相册
        format.html { redirect_to photos_url, notice: 'Photo was successfully created.' }#保存成功，跳转到相册列表页面
        # format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new }#保存失败，跳转到上传图片页面从新上传图片。
        # format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # # PATCH/PUT /photos/1
  # # PATCH/PUT /photos/1.json
  # def update
  #   respond_to do |format|
  #     if @photo.update(photo_params)
  #       format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @photo }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @photo.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy #删除选中的相册内容
    respond_to do |format|
      format.html { redirect_to photos_url, notice: 'Photo was successfully destroyed.' }#删除成功，跳转到相册列表页面
      # format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id]) #获取选中的相册内容，用于删除操作
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:title, :description, :picture) #获取view上传的相册内容
    end
end
