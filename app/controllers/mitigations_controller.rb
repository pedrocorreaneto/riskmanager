class MitigationsController < ApplicationController
  before_action :set_mitigation, only: [ :edit,  :destroy, :update]  
  before_action :set_threat, only: [ :create, :edit, :update]
  def create
    @mitigation = @threat.mitigations.new(mitigation_params)
    respond_to do |format|
      if @mitigation.save
	flash[:success]= 'Mitigation was successfully created.'
        format.json { render :show, status: :created, location: @mitigation }
      else
	flash_error
        format.json { render json: @mitigation.errors, status: :unprocessable_entity }
      end
     format.html { redirect_to threat_path(@threat) }
    end
  end

  def edit
  end

  def destroy
    threat_id=@mitigation.threat_id
    if @mitigation.destroy
      flash[:success] = "Mitigation was successfully destroyed."
    else
      flash_error
    end
      redirect_to threat_path(threat_id)
  end

  def update
    respond_to do |format|
      if @mitigation.update(mitigation_params)
	flash[:success] = 'Mitigation was successfully updated.'
        format.html { redirect_to @threat }
        format.json { render :show, status: :ok, location: @threat }
      else
	flash_error
        format.html { render :edit }
        format.json { render json: @threat.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def flash_error
      flash[:danger]=@mitigation.errors.full_messages  if not @mitigation.nil?
    end
    def set_threat
      @threat = Threat.find(params[:threat_id])
    end
    def set_mitigation
      @mitigation=Mitigation.find(params[:id])
    end

    def mitigation_params
      params.require(:mitigation).permit(:title,:description,:consequences)
    end
end
