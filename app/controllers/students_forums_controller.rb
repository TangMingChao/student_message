class StudentsForumsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_students_forum, only: [:upvote,:show, :edit, :update, :destroy]


  ################点赞方法#############
  def upvote
    @students_forum.votes.create
    redirect_to students_forums_url
  end


  # GET /students_forums
  # GET /students_forums.json
  def index
    @students_forums = StudentsForum.all
  end

  # GET /students_forums/1
  # GET /students_forums/1.json
  def show
    @user_name = current_user.email
  end

  # GET /students_forums/new
  def new
    @students_forum = StudentsForum.new
  end

  # GET /students_forums/1/edit
  def edit
  end

  # POST /students_forums
  # POST /students_forums.json
  def create
    @students_forum = StudentsForum.new(students_forum_params)

    respond_to do |format|
      if @students_forum.save
        format.html { redirect_to students_forums_url, notice: 'Students forum was successfully created.' }
        # format.json { render :show, status: :created, location: @students_forum }
      else
        format.html { render :new }
        # format.json { render json: @students_forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students_forums/1
  # PATCH/PUT /students_forums/1.json
  def update
    respond_to do |format|
      if @students_forum.update(students_forum_params)
        format.html { redirect_to @students_forum, notice: 'Students forum was successfully updated.' }
        # format.json { render :show, status: :ok, location: @students_forum }
      else
        format.html { render :edit }
        # format.json { render json: @students_forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students_forums/1
  # DELETE /students_forums/1.json
  def destroy
    @students_forum.destroy
    respond_to do |format|
      format.html { redirect_to students_forums_url, notice: 'Students forum was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_students_forum
      @students_forum = StudentsForum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def students_forum_params
      params.require(:students_forum).permit(:title, :description)
    end
end
