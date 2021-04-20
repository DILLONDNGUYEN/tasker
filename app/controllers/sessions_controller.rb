class SessionsController < ApplicationController


  get '/login' do 
      if logged_in?
        user_id = session[:user_id]
        
        redirect to "users/#{user_id}"
      else
        erb:"sessions/login"
      end
    end


  post '/login' do
     
      user = User.find_by(:email => params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect "users/#{user.id}"
      else
        flash[:error] = "User not found, please Sign up First!"
        redirect to '/users/new'
      end
    end

  get '/sessions/logout' do
      if logged_in?
        session.clear
        redirect to '/'
      else
        redirect to '/'
      end
    end
end
