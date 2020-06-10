class SessionsController < ApplicationController
  def new
  end

  skip_before_action :require_login, only: [:new, :create]

  def create
    user = User.where(username: params[:session][:username].downcase).first
    
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "Login success"
      log_in user
      redirect_to home_url
      puts "Login ngon r nhá"
    else
      flash[:danger] = "Invalid email/password combination"
      render :new
    end
  end

  def destroy
    log_out
    flash[:success] = "You are logged out"
    redirect_to login_path
  end
end
