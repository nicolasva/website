module Admin
  class PhotosController < AdminController
    before_action :set_photo, only: [:show, :edit, :update, :destroy]
    before_action :load_category_by_title, except: [:add_form_photo]
    before_action :load_annoncment_by_titl, except: [:add_form_photo]

    def index
      @photos = @annoncment.photos
    end

    def new
      @photo = @annoncment.photos.new
    end

    def edit
    end

    def create
      @photo = @annoncment.photos.new(photo_params)

      if @photo.save
        redirect_to admin_title_annoncment_photos_path(@category.title, @annoncment.title, notice: "Photo was successfully created")
      else
        render action: 'new'
      end
    end

    def update
      if @photo.update(photo_params)
        redirect_to admin_title_annoncment_photos_path(@category.title, @annoncment.title, notice: "Photo cas successfully updated")
      else
        render action: 'edit'
      end
    end

    def destroy
      @photo.destroy
      redirect_to edit_admin_title_annoncment_path(@category.title, @annoncment.title)
    end

    def add_form_photo
      respond_to do |format|
        format.js
      end
    end

    private 
      def set_photo
        @photo = Photo.find_by_uuid(params[:id]) 
      end

      def load_annoncment_by_title
        @annoncment = load_category_by_title.annoncments.find_by_title(params[:id])
      end

      def photo_params
        params.require(:photo).permit(:id,
                                      :photo,
                                      :photo_cache,
                                      :annoncment_id,
                                      :master_image,
                                      :uuid
                                     )
      end
  end
end
