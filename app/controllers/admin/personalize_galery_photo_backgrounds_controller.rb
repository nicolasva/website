module Admin
  class PersonalizeGaleryPhotoBackgroundsController < AdminController
    before_action :set_personalize_galery_photo_background, only: [:show, :edit, :update, :destroy]

    def index
      @personalize_galery_photo_backgrounds = PersonalizeGaleryPhotoBackground.all
    end

    def show

    end

    def new
      @personalize_galery_photo_backgrounds = PersonalizeGaleryPhotoBackground.new
    end

    def edit
    end

    def create
      @personalize_galery_photo_background = PersonalizeGaleryPhotoBackground.new(personalize_galery_photo_background_params)

      if @personalize_galery_photo_background.save
        redirect_to admin_personalize_galery_photo_backgrounds_path, notice: "La personalisation de l'arrière plan pour la galerie photo s'est bien déroulé, elle est désormais disponible"
      else
        render action: 'new'
      end
    end

    def update
      if @personalize_galery_photo_background.update(personalize_galery_photo_background_params)
        redirect_to admin_personalize_galery_photo_backgrounds_path, notice: "La mise à jour de l'arrière plan pour la galerie photo s'est bien déroulé, elle est désormais disponible"
      else
        render action: 'edit'
      end
    end

    def destroy
      notice = @personalize_galery_photo_background.destroy ? "La personalisation se l'arrière plan pour la galerie photo à bien été supprimé" : "La personalisation de l'arrière plan pour la galerie photo n'a pas été correctement supprimé"
      redirect_to admin_personalize_galery_photo_backgrounds_path, notice: notice
    end

    def activation
      notice = PersonalizeGaleryPhotoBackground.activation!(params[:personalize_galery_photo_background][:activations]) ? "L'activation de cette arrière plan pour la galerie d'image s'est bien déroulé, il est désormais disponible" : "L'activation de cette arrière plan pour la galerie d'image ne s'est pas déroulé correctement, il n'est pas disponible" 
      redirect_to admin_personalize_galery_photo_backgrounds_path, notice: notice
    end

    private
      def set_personalize_galery_photo_background
        @personalize_galery_photo_background = PersonalizeGaleryPhotoBackground.find_by_uuid(params[:id])
      end

      def personalize_galery_photo_background_params
        params.require(:personalize_galery_photo_background).permit(:id,
                                                                    :uuid,
                                                                    :title,
                                                                    :activation,
                                                                    activations: [],
                                                                    background_attributes: [:border, :border_style, :background_color, :delete_background_image, :no_background_image, :background_image, :cached_path, :no_repeat, :border_color, :align, :background_image_size, :cover, :opacity, :transparent, :id]
                                                                   )
      end 

  end
end
