class SessionsController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_to uploads_search_url
    else
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'    
    end
  end
  
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
  
  
end
