class RequirementsController < ApplicationController
  before_action :set_requirement, only: [:edit, :destroy, :update]
  def create
    @project = Project.find(params[:project_id])
    @requirement = @project.requirements.create(requirements_params)
    if @requirement.valid?
      redirect_to edit_project_requirement_path @project, @requirement
    else
      redirect_to project_path(@project)
    end
  end
  def edit
    @threat = @requirement.threat
    @solutions=@requirement.threat.solutions
  end
  def destroy
    project=@requirement.project
    @requirement.destroy
    redirect_to project_path(project), notice: "Requirement was sucessufully destroyed"
  end
  def update
    respond_to do |format|
      if @requirement.update(requirements_params)
        format.html { redirect_to @requirement.project, notice: 'Threat was successfully updated.' }
        format.json { render :show, status: :ok, location: @requirement.project }
      else
        format.html { render :edit }
        format.json { render json: @requirement.errors, status: :unprocessable_entity }
      end
    end
  end
  private
   def set_requirement
     @requirement =  Requirement.find params[:id]
   end
   def requirements_params
     p=params.require(:requirement).permit(:threat_id, :solution_id, :riskaccept)
     p[:riskaccept] = true if p[:solution_id].nil?
     return p
   end
end
