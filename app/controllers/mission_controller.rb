class MissionController < ApplicationController

  before_action :authenticate
  before_action :set_mission, only: [:show, :edit, :update, :destroy]

  def index
    @mission = Mission.all
  end

  def create
    @mission = Mission.new(mission_params)
    if @mission.save
      redirect_to mission_path
    else
      render :new
    end
  end

  def update

    if @mission.update(mission_params)
      redirect_to mission_path
    else
      render :edit
    end
  end

  def destroy
    @mission = Mission.find(params[:id])
    @mission.destroy
    redirect_to mission_path
  end

  def added_on
    self.created_at.strftime("%m/%d/%Y")
  end

end
