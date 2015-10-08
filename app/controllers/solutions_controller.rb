class SolutionsController < ApplicationController
  before_action :set_solution, only: [ :edit,  :destroy, :update]  
  before_action :set_threat, only: [ :create, :edit, :update]
  def create
    @solution = @threat.solutions.new(solution_params)
    respond_to do |format|
      if @solution.save
	flash[:success]= 'Solution was successfully created.'
        format.json { render :show, status: :created, location: @solution }
      else
	flash_error
        format.json { render json: @solution.errors, status: :unprocessable_entity }
      end
     format.html { redirect_to threat_path(@threat) }
    end
  end

  def edit
  end

  def destroy
    threat_id=@solution.threat_id
    if @solution.destroy
      flash[:success] = "Solution was successfully destroyed."
    else
      flash_error
    end
      redirect_to threat_path(threat_id)
  end

  def update
    respond_to do |format|
      if @solution.update(solution_params)
	flash[:success] = 'Solution was successfully updated.'
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
      flash[:danger]=@solution.errors.full_messages  if not @solution.nil?
    end
    def set_threat
      @threat = Threat.find(params[:threat_id])
    end
    def set_solution
      @solution=Solution.find(params[:id])
    end

    def solution_params
      params.require(:solution).permit(:title,:description,:cons)
    end
end
