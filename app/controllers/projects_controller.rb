class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @risk = Risk.new
    usedthreats = @project.risks.map {|r| r.threat.id}
    @threats= Threat.where.not(id: usedthreats)
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    respond_to do |format|
      if @project.save
	flash[:success]= 'Project was successfully created.'
        format.html { redirect_to @project }
        format.json { render :show, status: :created, location: @project }
      else
	flash_error
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
	flash[:success]= 'Project was successfully updated.'
        format.html { redirect_to @project }
        format.json { render :show, status: :ok, location: @project }
      else
	flash_error
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      flash[:success]= 'Project was successfully destroyed.'
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

  private
   def flash_error
	flash[:danger] = @project.errors.full_messages if not @project.nil?
   end
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :description)
    end
end
