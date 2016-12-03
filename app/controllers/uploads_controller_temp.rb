class UploadsController < ApplicationController
  before_action :logged_in_user
  wrap_parameters format: :json

  def index
    @uploads = Upload.all
  end

  def show
    @upload = Upload.find(params[:id])
  end

  def new
    @image = Image.new
    @upload = Upload.new
    3.times {@upload.tags.build}
    2.times {@upload.protections.build}
  end
  
  def test
    @image = Image.new
    # @upload = Upload.new
    #@upload.images.build 
    # if Upload.find(Upload.ids.first).permission.present?
    #     @upload = Upload.new
    #   # @upload.images.build
    # else
    #     @upload = Upload.find(Upload.ids.first)
    #     @upload.images.build
    # end
    
    
    # if Upload.find(Upload.ids.first).permission.present?
    #   @image.upload.id = Upload.ids.first
    # else
    #   @image.upload_id = Upload.ids.first + 1
    # end
    

    #@upload.images.build
  end

  def edit
    @upload = Upload.new
    3.times {@upload.images.build}
  end


  def create
  #@upload = current_user.uploads.build(upload_params)
  #@upload = current_user.uploads.create(upload_params)
  #@upload = Image.create(params[:file])
  #@upload = current_user.uploads.image.create(:image)
  @image = Image.create(imgup_params)

    
  if @image.save #saving images with dropzone
      render json: { message: "success" }, :status => 200
         
    # @upload = current_user.uploads.build(upload_params) 
         
    # if @upload.save #saving other information other than image files
    #   flash[:success] = "Upload was successfully created!"
    #   redirect_to @upload
    # else
    #   render 'upload/'
    # end

  else
      render json: { error: @image.errors.full_messages.join(',')}, :status => 400
  end
  

  end
  



  def update

  end

  def destroy
    @image = Image.find(113)
    if @upload.destroy    
      render json: { message: "File deleted from server" }
    else
      render json: { message: @upload.errors.full_messages.join(',') }
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
  

  
  private
  
    def upload_params
      params.require(:upload).permit(:description, :permission, :url,
                    tags_attributes: [:tagname], protections_attributes: [:sharedid])
    end
    
    def imgup_params
      params.require(:image).permit(:image)
    end
    
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
  
end