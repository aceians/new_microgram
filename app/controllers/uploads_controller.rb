class UploadsController < ApplicationController

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

  end

  def edit
    @upload = Upload.new
    3.times {@upload.images.build}
  end


  def create
  @upload = current_user.uploads.build(upload_params)
    if @upload.save
      flash[:success] = "Upload was successfully created!"
      redirect_to @upload
    else
      render 'static_pages/home'
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
  
  private

    def upload_params
      params.require(:upload).permit(:description, :url, :permission, images_attributes: [:image], tags_attributes: [:tagname])
    end
  
end