class UserController < ApplicationController

  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
       log_in(@user)
      flash[:success] = "Account Created!"
       else
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id]) 
  end

  
  end


end
