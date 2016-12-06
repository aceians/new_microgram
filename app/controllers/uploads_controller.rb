class UploadsController < ApplicationController
  before_action :logged_in_user
  layout "something"

  def index
    @uploads = Upload.all
  end

  def show
    @upload = Upload.find(params[:id])
  end

  def new
    @upload = Upload.new
    @upload.images.build
    6.times {@upload.tags.build}
    2.times {@upload.protections.build}
  end

  def edit
    @user = User.find(params[:id])
  end


  def create
    @upload = current_user.uploads.build(upload_params)
    if @upload.save
      flash[:success] = "Upload was successfully created!"
      redirect_to @upload
    else
      render 'uploads_url'
    end

  end
  #@upload = Upload.create(upload_params)
  #@sharedid = current_user.uploads.build(protections_params) # for shared users


  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @upload.destroy
    respond_to do |format|
      format.html { redirect_to uploads_url, notice: 'Upload was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
    def mysubmission
    @all_submission = current_user.uploads.all
    end
  
  def sharedToMe
    data = Array.new
    data = Protection.pluck(:sharedid,:upload_id)

    previous_upid = 0
    @shared = Array.new
    data.each do |(email, upid)|
      if email == current_user.email && previous_upid != upid
        @shared << upid
        previous_upid = upid
      end
    end

  end
  
  def search
   #@datas = Upload.where(permission: "Public")
    if params[:search]
      @tags = Tag.search(params[:search]).order("created_at DESC")
      @ids = @tags.pluck(:upload_id)
    end
  end
  
  
  private

    def upload_params
      params.require(:upload).permit(:description, :permission, :url, 
                     images_attributes: [:image], tags_attributes: [:tagname], protections_attributes: [:sharedid])
    end
    
      def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
  
end