class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  before_action :photo_owner, only: [:edit, :update, :destroy]

  # GET /photos
  # GET /photos.json
  def index
    @photos = Photo.all.order(created_at: :desc)
  end
  # GET /photos/1
  # GET /photos/1.json
  def show
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
  end
  # POST /photos
  # POST /photos.json
  def create
    @photo = current_user.photos.create!(photo_params)
    if @photo.save
     redirect_to photo_path(@photo)
    else
      render :new 
    end
  end
  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    if @photo.update(photo_params)
      redirect_to photos_path
    else
      render :edit
    end
  end
  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to user_photos_url, notice: 'Photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end
    def photo_owner
      @photo = Photo.find(params[:id])
      if (@photo.user_id != current_user.id)
        flash[:notice] = 'Access denied as you are not owner of this Photo'
        redirect_to root_path
      end
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:title, :body, :image, :user_id)
    end
end
