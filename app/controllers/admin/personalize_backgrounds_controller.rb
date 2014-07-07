module Admin
  class PersonalizeBackgroundsController < AdminController
    before_action :set_personalize_background, only: [:show, :edit, :update, :destroy]
    def index
      @personalize_backgrounds = PersonalizeBackground.all
    end

    def show
    end

    def new
      @personalize_background = PersonalizeBackground.new
    end

    def edit
    end

    def create
      @personalize_background = PersonalizeBackground.new(personalize_background_params)

      if @personalize_background.save
        redirect_to admin_personalize_backgrounds_path, notice: t(".personalize_background_success_created")
      else
        render action: 'new'
      end
    end

    def update
      if @personalize_background.update(personalize_background_params)
        redirect_to admin_personalize_backgrounds_path, notice: t(".personalize_background_success_updated")
      else
        render action: 'edit'
      end
    end

    def destroy
      notice = @personalize_background.destroy ? t(".personalize_background_success_destroyed") : t(".personalize_background_not_success_destroyed")
      redirect_to admin_personalize_background_path, notice: notice
    end

    def activation
      notice = PersonalizeBackground.activation!(params[:personalize_background][:activation]) ? t(".personalize_background_success_defined") : t(".personalize_background_was_not_success_defined")
      redirect_to admin_personalize_background_path, notice: notice
    end

    private
      def set_personalize_background
        @personalize_background = PersonalizeBackground.find_by_uuid(params[:id])
      end

      def personalize_background_params
        params.require(:personalize_background).permit(:id,
                                                       :title,
                                                       :font_color,
                                                       :activation,
                                                       :margin_top,
                                                       height_screen_attributes: [:height],
                                                       background_attributes: [:border, :border_style, :background_color, :delete_background_image, :no_background_image, :background_image, :cached_path, :no_repeat, :border_color, :background_image_size, :cover, :opacity, :id],
                                                       nifty_corner_attributes: [:nifty_corner, :border_radius]
                                                      )
      end
  end
end
