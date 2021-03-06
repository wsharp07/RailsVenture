class SessionsController < ApplicationController
  def new
    render :layout =>  'login'
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      else
        message = "Account not activated."
        message += "Check your email for activation link."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      # Create an error message.
      flash.now[:danger] = 'Invalid username/password combination'
      render 'new', :layout => 'login'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
