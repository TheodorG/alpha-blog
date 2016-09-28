class SessionsController < ApplicationController
    
    def new
        
    end
    
    def create
       user = User.find_by(email: params[:session][:email])
       if user && user.authenticate(params[:session][:password])
           session[:user_id] = user.id
           flash[:success] = "Your are logged in"
           redirect_to user_path(user)
       else
           flash.now[:danger] = "Your email or your password were wrong. Please try again"
           render 'new'
       end
    end
    
    def destroy
       session[:user_id] = nil
       flash[:success] = "Your are logged out"
       redirect_to root_path
    end
    
end