class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  # GET /photos
  # GET /photos.json
  def index
    @photos = Photo.all
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @photo = current_user.photos.find(params[:id])
  end

  # GET /photos/new
  def new
    @photo = current_user.photos.build
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @photo }
    end
  end

  # GET /photos/1/edit
  def edit
    @photo = current_user.photos.find(params[:id])
  end

  # POST /photos
  # POST /photos.json
  def create

    @photo = current_user.photos.create!(photo_params)

    
      if @photo.save
       redirect_to user_photo_path(@photo)
      else
       render :new 
       
      end
    
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update

      respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo = current_user.photos.find(params[:id])
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to user_photos_url, notice: 'Photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:title, :body, :image, :user_id)
    end
end
