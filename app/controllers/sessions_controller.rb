class SessionsController < ApplicationController


  def new
    if logged_in?
      redirect_to missions_path
      flash[:notice] = "You are already logged in."
    else
      @user = User.new
    end
  end

  def create
    user = User.find_by(email: params[:user][:email])
    #byebug
    if user && user.authenticate(params[:user][:password])
      log_in(user)
      flash[:success] = "Logged in!"
      redirect_to missions_path
    else
      flash[:error] = "An Error Occurred, Please Try Again."
      redirect_to login_path
    end
  end


  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
  # get '/login' do 
  #     if logged_in?
  #       user_id = session[:user_id]
        
  #       redirect to "users/#{user_id}"
  #     else
  #       erb:"sessions/login"
  #     end
  #   end


  # post '/login' do
     
  #     user = User.find_by(:email => params[:email])
  #     if user && user.authenticate(params[:password])
  #       session[:user_id] = user.id
  #       redirect "users/#{user.id}"
  #     else
  #       flash[:error] = "User not found, please Sign up First!"
  #       redirect to '/users/new'
  #     end
  #   end

  
end
