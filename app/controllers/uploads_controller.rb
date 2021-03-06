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
    #@upload.images.build
    6.times {@upload.tags.build}
    3.times {@upload.protections.build}
    
  end

  def edit
    @upload = Upload.find(params[:id])
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


  def update
    @upload = Upload.find(params[:id])
    if @upload.update_attributes(upload_params)
      flash[:success] = "Submission is updated"
      redirect_to @upload
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
      params.require(:upload).permit(:id, :description, :permission, :url, :image_delete, 
                     images_attributes: [:id, :image], tags_attributes: [:id, :tagname], protections_attributes: [:id, :sharedid])
    end
    
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
  
end