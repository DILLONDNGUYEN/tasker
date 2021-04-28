class ApplicationController < ActionController::Base

  include ApplicationHelper
  # helper_method :log_in, :logged_in?, :current_user, :authenticate, :authorized?

  private
    # def log_in(user)
    #   session[:user_id]= user.id
    # end

    # def logged_in?
    #   !!current_user
    # end
    
    # def current_user
    #   @current_user = User.find_by(id: session[:user_id])
    # end

    # def authenticate
    #   if !logged_in? || current_user.nil?
    #     redirect_to login_path
    #   end
    # end

    # def authorized?
    #   !!logged_in? && !current_user.nil?
    # end

end
