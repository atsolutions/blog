class ApplicationController < ActionController::Base
    
    helper_method :current_user, :logged_in?

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def require_user
        if !logged_in?
            flash[:danger] = "You have to log in to perform this action"
            redirect_to root_path
        end
    end

    def require_admin
        if !logged_in?||(logged_in? && !current_user.admin?)
            flash[:danger] = "You have to log in as admin to perform this action"
            redirect_to root_path
        end
    end
end
