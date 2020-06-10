class SessionsController < ApplicationController
  
  skip_before_action :require_login, only: [:new, :create]

  def new
    if logged_in?
      redirect_to home_url
    end
  end

  def create
    puts "alo alo alo"
    user = User.where(username: params[:session][:username].downcase).first
    
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "Login success"
      log_in user
      redirect_to home_url
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
