class UploadsController < ApplicationController
  #before_action :logged_in_user, only: [:create, :destroy, :show]
  # before_action :set_upload, only: [:show, :edit, :update, :destroy]

  # GET /uploads
  # GET /uploads.json
  def index
    @uploads = Upload.all
  end

  # GET /uploads/1
  # GET /uploads/1.json
  def show
      @upload = Upload.find(params[:id])
  end

  # GET /uploads/new
  def new
    @upload = Upload.new
    3.times {@upload.images.build}
  end

  # GET /uploads/1/edit
  def edit
    @upload = Upload.new
    3.times {@upload.images.build}
  end

  # POST /uploads
  # POST /uploads.json
  def create
  @upload = current_user.uploads.build(upload_params)
    if @upload.save
      flash[:success] = "Upload was successfully created!"
      redirect_to @upload
    else
      render 'static_pages/home'
    end

  
  end
    #respond_to do |format|
    #  if @upload.save
    #    format.html { redirect_to @upload, notice: 'Upload was successfully created.' }
    #    format.json { render :show, status: :created, location: @upload }
    #  else
    #    format.html { render :new }
    #    format.json { render json: @upload.errors, status: :unprocessable_entity }
    #  end
    #end


  # PATCH/PUT /uploads/1
  # PATCH/PUT /uploads/1.json
  def update

  end

  # DELETE /uploads/1
  # DELETE /uploads/1.json
  def destroy
    @upload.destroy
    respond_to do |format|
      format.html { redirect_to uploads_url, notice: 'Upload was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private

    def upload_params
      params.require(:upload).permit(:description, :url, :permission, images_attributes: [:image])
    end
  
end