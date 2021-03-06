class UsersController < ApplicationController

    before_action :set_user, only: [:show]
def new
    @user = User.new
end
def create
    @user = User.new  (user_params)
        if @user.save
            flash[:success] = "You have succesfully signed up" 
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
end
def show
    
end

def index
    @users = User.all
end

private
def user_params
    params.require(:user).permit(:username, :email, :password)
end

def set_user
    @user = User.find(params[:id])
end

end