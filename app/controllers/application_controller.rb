class ApplicationController < ActionController::Base
    private
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    helper_method :current_user

    def authorize
        redirect_to posts_url, notice: "you must be logged in to see/create post!" if current_user.nil?
    end
end
