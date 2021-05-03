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

  def googleomniauth 
    access_token = request.env['omniauth.auth']
    # binding.pry
    @user = User.from_omniauth(auth_hash)
    @user.google_token = access_token.credentials.token
    refresh_token = access_token.credentials.refresh_token
    @user.google_refresh_token = refresh_token if refresh_token.present?
    # binding.pry
      if @user.save
    # binding.pry 
        flash[:success] = "Hello #{@user.username}"
    #  binding.pry
        log_in(@user)
        redirect_to missions_path

      else
        flash[:error] = "Something Wrong Happened, try again"
        redirect_to login_path  
    end
  end


  
  
  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
  
  
  private
  
    def auth_hash
      request.env['omniauth.auth']
    end

  
end
