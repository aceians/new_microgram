class UsersController < ApplicationController
  layout 'something', :only => [:edit, :show]
  
  def index
    @users = User.wherepaginate(page: params[:page])
  end
    
  def show
    @user = User.find(params[:id])
    @uploads = @user.uploads.paginate(page: params[:page])
  end
  
  def new
    @user = User.new
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:info] = "Your account is created and successfully logged in."
      redirect_to uploads_search_url
    else
      render 'new'
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :individualrole, :org, :dept, :password,
                                   :password_confirmation)
    end
    
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    
        # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
       redirect_to(root_url) unless current_user?(@user)
    end
end