class StudentsInfosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_students_info, only: [:show, :edit, :update, :destroy]

  # GET /students_infos
  # GET /students_infos.json
  def index
    @students_infos = StudentsInfo.all
  end

  # GET /students_infos/1
  # GET /students_infos/1.json
  def show
  end

  # GET /students_infos/new
  def new
    @students_info = StudentsInfo.new
  end

  # GET /students_infos/1/edit
  def edit
  end

  # POST /students_infos
  # POST /students_infos.json
  def create
    @students_info = StudentsInfo.new(students_info_params)

    respond_to do |format|
      if @students_info.save
        format.html { redirect_to students_infos_url notice: 'Students info was successfully created.' }
        # format.json { render :show, status: :created, location: @students_info }
      else
        format.html { render :new }
        # format.json { render json: @students_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students_infos/1
  # PATCH/PUT /students_infos/1.json
  def update
    respond_to do |format|
      if @students_info.update(students_info_params)
        format.html { redirect_to @students_info, notice: 'Students info was successfully updated.' }
        # format.json { render :show, status: :ok, location: @students_info }
      else
        format.html { render :edit }
        # format.json { render json: @students_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students_infos/1
  # DELETE /students_infos/1.json
  def destroy
    @students_info.destroy
    respond_to do |format|
      format.html { redirect_to students_infos_url, notice: 'Students info was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_students_info
      @students_info = StudentsInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def students_info_params
      params.require(:students_info).permit(:name, :sex, :number, :phone, :picture, :age, :email, :sign, :qq, :address)
    end
end
