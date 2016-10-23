class SessionsController < ApplicationController
  def new
    #@user = User.new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in user
      # render "login_success" # this is inserted for the purpose of a test
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      render "login_fail" # this is inserted for the purpose of a test      
    end
  end
  
  def login_success
  end

  def login_fail
  end
  
  def destroy
  end
  
  
end
