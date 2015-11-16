class ThreatsController < ApplicationController
  before_action :set_threat, only: [:show, :edit, :update, :destroy]
  # GET /threats
  # GET /threats.json
  def index
    @threats = Threat.all
  end

  # GET /threats/1
  # GET /threats/1.json
  def show
    @mitigation = Mitigation.new
  end

  # GET /threats/new
  def new
    @threat = Threat.new
  end

  # GET /threats/1/edit
  def edit
  end

  # POST /threats
  # POST /threats.json
  def create
    @threat = Threat.new(threat_params)
    respond_to do |format|
      if @threat.save
	flash[:success] = 'Threat was successfully created.' 
        format.html { redirect_to @threat }
        format.json { render :show, status: :created, location: @threat }
      else
	flash_error
        format.html { render :new }
        format.json { render json: @threat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /threats/1
  # PATCH/PUT /threats/1.json
  def update
    respond_to do |format|
      if @threat.update(threat_params)
	flash[:success] = 'Threat was successfully updated.'
        format.html { redirect_to @threat }
        format.json { render :show, status: :ok, location: @threat }
      else
	flash_error
        format.html { render :edit }
        format.json { render json: @threat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /threats/1
  # DELETE /threats/1.json
  def destroy
    if @threat.destroy
      flash[:success]= 'Threat was successfully destroyed.'
    else
      flash_error
    end
    respond_to do |format|
        format.html { redirect_to threats_url }
        format.json { head :no_content }
    end
  end

  private
    def flash_error
      p @threat.errors.full_messages
      flash[:danger]=@threat.errors.full_messages if not @threat.nil?
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_threat
      @threat = Threat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def threat_params
      params.require(:threat).permit(:title, :category, :description)
    end
end
