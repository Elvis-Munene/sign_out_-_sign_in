class ApplicationController < ActionController::Base
    before_action :set_current_user
    def set_current_user
        #finds user with session data and stores it if present
        Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
    end
    def require_user_logged_in!
        #allows only logged in users
        redirect_to_sign_in_path, alert: 'You must be signed in' if Current.user.nil? 
    end
end
