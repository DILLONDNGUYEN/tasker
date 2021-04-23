class TasksController < ApplicationController

before_action :require_login
  before_action :set_task, only: [:edit, :update, :destroy, :complete]


  def create
    @task = Task.new(task_params)

    if @task.save
       redirect_to mission_path
    else
      render :new
    end

  end

  def index

    if params[:user_id]
      if User.find(params[:user_id]) == current_user
        @user = User.find(params[:user_id])
        @tasks = @user.tasks
      else
        redirect_to mission_path
        flash[:notice] = "Can't Do that"
      end
    else
      @tasks = Tasks.all
    end
  end

  def create

    @task = Task.new(task_params)

    if @task.save
       redirect_to missions_path
    else
      render :new
    end
  end

  def update

    if @task.update(task_params)

      redirect_to missions_path
    else
      render :edit
    end
  end

   def destroy

    @tasks.destroy

    redirect_to missions_path
  end

end
