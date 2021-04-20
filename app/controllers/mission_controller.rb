class MissionController < ApplicationController

  before_action :authenticate
  before_action :set_mission, only: [:show, :edit, :update, :destroy]



end
