class MissionsController < ApplicationController

  before_action :authenticate
  before_action :set_mission, only: [:show, :edit, :update, :destroy]

  def index
    @missions = Mission.all
  end

  def show
    @task = @mission.tasks
  end

  def create
    @mission = Mission.new(mission_params)
    if @mission.save
      redirect_to missions_path
    else
      render :new
    end
  end

  def update

    if @mission.update(mission_params)
      redirect_to missions_path
    else
      render :edit
      
    end
  end

  def destroy
    @mission = Mission.find(params[:id])
    @mission.destroy
    redirect_to missions_path
  end


end
