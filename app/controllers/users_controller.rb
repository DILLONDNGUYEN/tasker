class UsersController < ApplicationController

def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
#byebug
    if @user.save
       log_in(@user)
      flash[:success] = "Account Created!"

      redirect_to missions_path
       else
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id]) 
  end

private

def user_params
  params.require(:user).permit(:username, :password, :password_confirmation, :email)
  # params.permit(:user, :username, :password, :password_confirmation, :email, :authenticity_token, :mission, :commit)
end




end



