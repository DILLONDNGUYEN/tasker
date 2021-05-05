class MissionsController < ApplicationController

  before_action :authenticate
  before_action :find_mission, only: [:show, :edit, :update, :destroy, :redirect_not_owner, :create]
  # before_action :task_params, except:[:show]
  before_action :redirect_not_owner, only: [:edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  def index
    @incompleted_missions = Mission.incompleted
    @completed_missions = Mission.completed
    
  end

# if params[:user_id] && @user= User.find_by_id(params[:user_id])
#   @missions = @user.missions 
# else

  def show
    # binding.pry
    # @mission.tasks.build(description: params[:description])
    # if @mission.save
    #    redirect_to mission_path
    # else
    #   render :new
   
    #  end
  end
  
  def new
    @mission = Mission.new
  end

  
  def create
    @mission = Mission.new(mission_params)
   #binding.pry
    @mission.creator = current_user
    if @mission.save
      redirect_to missions_path
    else
      render :new
    end
  end

  
  def edit
  end


  
  # def completed_mission
  #binding.pry
  #   if !!@mission.completed
  #     redirect_to completed_missions_path
  #   else
  #     redirect_to mission_path
  #   end
  # end
  
  
  def update
    # binding.pry
    if @mission.update(mission_params)
      redirect_to mission_path
    # elsif
    #   @mission.completed
    else
      render :edit 
    end
  end
  
  def completed
    # byebug
  #  binding.pry
  @mission = Mission.find(params[:mission][:id]) rescue nil
  @mission.completed = !@mission.completed
  @mission.save
  redirect_to missions_path
  # if @mission.completed
  #     @mission.completed = false
  #     @mission.save
  #   redirect_to mission_path(@mission)
  #   else
  #     @mission.completed = true
  #     @mission.save
  #     redirect_to missions_path
  #   end
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
  

  
  def find_mission
    # binding.pry
    @mission = Mission.find(params[:id]) rescue nil
  end

  def redirect_not_owner
    if current_user != @mission.creator
      redirect_to mission_path(@mission)
    end
  end

  def completed_params
     params.permit(:name, :completed)
  end
  
  def mission_params
    # binding.pry
    params.fetch(:mission, {}).permit(:name, :completed)
    # binding.pry
    # params.permit(:name, :mission)
  end
end
