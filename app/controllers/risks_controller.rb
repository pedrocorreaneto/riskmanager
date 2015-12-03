class RisksController < ApplicationController
  before_action :set_risk, only: [:show, :edit, :destroy, :update]
  def create
    @project = Project.find(params[:project_id])
    @risk = @project.risks.create(risks_params)
    if @risk.valid?
      flash[:success]= 'Risk was successfully created.'
      redirect_to edit_project_risk_path @project, @risk
    else
      flash_error
      redirect_to project_path(@project)
    end
  end
  def edit
    @threat = @risk.threat
    @mitigations=@risk.threat.mitigations
  end
  def destroy
    project=@risk.project
    @risk.destroy
    flash[:success]="Risk was sucessufully destroyed"
    redirect_to project_path(project)
  end
  def update
    respond_to do |format|
      if @risk.update(risks_params)
	flash[:success]= 'Risk was successfully updated.'
        format.html { redirect_to project_risk_path(@risk.project, @risk) }
        format.json { render :show, status: :ok, location: @risk.project }
      else
	flash_error
        format.html { render :edit }
        format.json { render json: @risk.errors, status: :unprocessable_entity }
      end
    end
  end
  private
   def flash_error
      flash[:danger]= @risk.errors.full_messages if not @risk.nil?
   end
   def set_risk
     @risk =  Risk.find params[:id]
   end
   def risks_params
     par=params.require(:risk).permit(:threat_id, {:mitigation_ids=>[]} , :riskaccept, :probability, :impact, :exposure)
     par["mitigation_ids"] ||= []
     par
   end
end
