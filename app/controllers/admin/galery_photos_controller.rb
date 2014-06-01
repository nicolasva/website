module Admin
  class GaleryPhotosController < AdminController
    before_action :set_galery_photo, only: [:show, :edit, :update, :destroy]
    before_action :load_category_by_title

    def index
      @galery_photos = @category.galery_photos.all
    end 

    def show
    end

    def new
      @galery_photo = @category.galery_photos.new
    end

    def edit
    end

    def create
      @galery_photo = @category.galery_photos.new(galery_photo_params)

      if @galery_photo.save
        if @submenu.nil?
          redirect_to admin_title_galery_photos_path(@category.title), notice: t(".galery_photo_was_successfully_created")
        else
          redirect_to admin_title_title_submenu_galery_photos_path(@category.title, @submenu.title), notice: t(".galery_photo_was_successfully_created")
        end
      else
        render action: "new"
      end
    end

    def update
      if @galery_photo.update(galery_photo_params)
        if @submenu.nil?
          redirect_to admin_title_galery_photos_path(@category.title), notice: t(".galery_photo_was_successfully_updated")
        else
          redirect_to admin_title_title_submenu_galery_photos_path(@category.title, @submenu.title), notice: t(".galery_photo_was_successfully_updated")
        end
      else
        render action: "edit"
      end
    end

    def show
      @galery_photo = GaleryPhoto.find_by_uuid(params[:id])
    end

    def destroy
      notice = @galery_photo.destroy ? t(".photo_was_successfully_destroyed") : t(".photo_was_not_successfully_destroyed")
      
      if @submenu.nil?
        redirect_to admin_title_galery_photos_path(@category.title), notice: notice
      else
        redirect_to admin_title_title_submenu_galery_photos_path(@category.title, @submenu.title), notice: notice
      end
    end

    def sort
      params[:galery_photo].each_with_index do |id, index|
        GaleryPhoto.position(index+1, id)
      end

      render :nothing => true
    end

    private
      def set_galery_photo
        @galery_photo = GaleryPhoto.find_by_uuid(params[:id])
      end

      def galery_photo_params
        params.require(:galery_photo).permit(:id,
                                             :title,
                                             :english_title,
                                             :comment,
                                             :english_comment,
                                             :photogalery,
                                             :photogalery_cache,
                                             :submenu_id,
                                             :category_id
                                            )
      end
  end
end
