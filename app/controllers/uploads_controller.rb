class UploadsController < ApplicationController
  before_action :logged_in_user

  def index
    @uploads = Upload.all
  end

  def show
    @upload = Upload.find(params[:id])
  end

  def new
    @upload = Upload.new
    3.times {@upload.images.build}
    3.times {@upload.tags.build}
    2.times {@upload.protections.build}
  end

  def edit
    @upload = Upload.new
    3.times {@upload.images.build}
  end


  def create
  #@upload = current_user.uploads.build(upload_params)
  # wrap_parameters format: [:json]
  @upload = current_user.uploads.new(upload_params)
  if @upload.save
      # render json: { message: "success" }, :status => 200
  else
      render json: { error: @upload.errors.full_messages.join(',')}, :status => 400
  end

  end


  def update

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
  
  def test
    @upload = Upload.new
    #@upload.images.build
  end
  
  private
  
    def upload_params
      params.require(:upload).permit(:description, :permission, :url, images_attributes: [:image] ,
                    tags_attributes: [:tagname], protections_attributes: [:sharedid])
    end

    # def upload_params
    #   params.require(:upload).permit(:description, :permission, :url, images_attributes: [:image],
    #                 tags_attributes: [:tagname], protections_attributes: [:sharedid])
    # end
    
  #   def parameters
  #   params.respond_to?(:permit) ?
  #       params.require(:picture).permit(:identifier => [ :name ]) :
  #       params[:picture].slice(:identifier => [ :name ]) rescue nil
  # end
    
    def images_params
      params.require(:upload).permit(images_attributes: [:image])
    end
    
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
  
end