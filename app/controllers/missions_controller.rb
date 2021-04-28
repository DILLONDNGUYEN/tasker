class MissionsController < ApplicationController

  before_action :authenticate
  before_action :set_mission, only: [:show, :edit, :update, :destroy]
  before_action :redirect_not_owner, only: [:edit, :update, :destroy]

  def index
    if params[:user_id] && @user= User.find_by_id(params[:user_id])
      
      @missions = @user.missions
      
    else
    @missions = Mission.all
    end
  end

  def show
    @task = @mission.tasks
  end
  
  def new
    @mission = Mission.new
  end

  
  def create
    @mission = Mission.new(mission_params)
    # binding.pry
    @mission.creator = current_user
    if @mission.save
      redirect_to missions_path
    else
      render :new
    end
  end
  
  def edit
    
  end
  
  def update
    
    if @mission.update(mission_params)
      redirect_to missions_path
    else
      render :edit
      
    end
  end
  
  def completed
    @mission.update(completed: true)
  end
  
  def destroy
    
    if @mission.destroy
      redirect_to missions_path
    else
      flash[:error] = "Mission can't be destroyed."
      redirect_to mission_path(@mission)
    end
  end
  
  private
  
  def redirect_not_owner
    if current_user != @mission.creator
      redirect_to mission_path(@mission)
    end
  end
  
  def mission_params
    params.require(:mission).permit(:name)

  end
  
end
