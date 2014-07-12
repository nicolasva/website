class GaleryPhotosController < ApplicationController
  before_action :set_galery_photo, only: [:show, :edit, :update, :destroy]

  # GET /galery_photos
  # GET /galery_photos.json
  def index
    @galery_photos = parent.galery_photo.joins(:publication).where(publications: { publication: true})
  end

  # GET /galery_photos/1
  # GET /galery_photos/1.json
  def show
  end

  # GET /galery_photos/new
  def new
    @galery_photo = GaleryPhoto.new
  end

  # GET /galery_photos/1/edit
  def edit
  end

  # POST /galery_photos
  # POST /galery_photos.json
  def create
    @galery_photo = GaleryPhoto.new(galery_photo_params)

    respond_to do |format|
      if @galery_photo.save
        format.html { redirect_to @galery_photo, notice: 'Galery photo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @galery_photo }
      else
        format.html { render action: 'new' }
        format.json { render json: @galery_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /galery_photos/1
  # PATCH/PUT /galery_photos/1.json
  def update
    respond_to do |format|
      if @galery_photo.update(galery_photo_params)
        format.html { redirect_to @galery_photo, notice: 'Galery photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @galery_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /galery_photos/1
  # DELETE /galery_photos/1.json
  def destroy
    @galery_photo.destroy
    respond_to do |format|
      format.html { redirect_to galery_photos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_galery_photo
      @galery_photo = GaleryPhoto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def galery_photo_params
      params[:galery_photo]
    end
end
