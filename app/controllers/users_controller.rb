class UsersController < ApplicationController
  
  def index
    @users = User.wherepaginate(page: params[:page])
  end
    
  def show
    @user = User.find(params[:id])
    @uploads = @user.uploads.paginate(page: params[:page])
    redirect_to root_url and return unless @user.activated
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
      flash[:info] = "Your account is created."
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :individualrole, :org, :dept, :password,
                                   :password_confirmation)
    end
end