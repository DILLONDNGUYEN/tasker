class ApplicationController < ActionController::Base

    def logged_in?
      !!current_user
    end
    
    def current_user
      @current_user = User.find_by(id: session[:user_id])
    end

    def authenticate
      if !logged_in? || current_user.nil?
        redirect '/login'
      end
    end

    def authorized?
      !!logged_in? && !current_user.nil?
    end

end
