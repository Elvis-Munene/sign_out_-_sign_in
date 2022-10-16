class SessionsController < ApplicationController
    def new; end
    def create 
        user = User.find_by(email: params[:email])
        #finds the existing user checks if the user can be authenticated.
        if user.present? && user.authenticate(params[:password])
            #sets up user.id sessions
        session[:user_id] = user.id
        redirect_to_root_path, notice: 'Logged in successfully'
        else
            flash.now[:alert] = 'Invalid email or password'
            reder :new
        end
        def destroy
            #deletes the user session
            session[:user_id] = nil
            redirect_to_root_path, notice: 'Logged Out'
        end

end
