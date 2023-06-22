class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user and @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to posts_path, notice: "Logged In"
    else
      flash.now[:notice] = "Email or password is invalid"
      render :new
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to posts_path, notice: "Logged Out"
  end


end
