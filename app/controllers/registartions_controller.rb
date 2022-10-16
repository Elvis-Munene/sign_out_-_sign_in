class RegistartionsController < ApplicationController

def new
    @user = User.new
end

def create
    @user = User.new(use_params)
    if @user.save
        #stores saved user id in a session
        session["user_id"] = @user.user_id
        redirect_to_root_path, notice: "Successfully created account"
    else
        render :new
    end
    private
    def user_params
        #strong parameters
        params.require(:user).permit(:email,:password, :password_confirmation)
    end
end
