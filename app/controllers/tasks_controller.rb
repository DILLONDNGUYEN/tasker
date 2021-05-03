class TasksController < ApplicationController

  before_action :find_task, except: [:new, :create]
  # before_action :set_task, only: [:edit, :update, :destroy, :complete]
 

  def index

    if params[:user_id] && User.find(params[:user_id]) == current_user
        @tasks = @user.tasks
      elsif
        redirect_to missions_path
        flash[:notice] = "Can't Do that"
      else
      @tasks = Tasks.all
    end
  end


  def create
# binding.pry
    @task = Task.new(task_params)
    # @task.user = current_user
    if @task.save
       redirect_to missions_path
    else
      render :new
    end
  end


  def new
    @task = Task.new
  end


  def update

    if @task.update(task_params)

      redirect_to missions_path
    else
      render :edit
    end
  end


   def destroy

    @task.destroy
    redirect_to mission_path(@task.mission)
  end


  private

  def find_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:description, :mission_id)
  end


end
