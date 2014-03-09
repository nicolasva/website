module Admin
  class MenuBackgroundsController < Application
    before_action :set_menu_background, only: [:show, :edit, :update, :destroy]

    def index
      @menu_backgrounds = MenuBackground.all
    end

    def show
    end

    def new
      @menu_background = MenuBackground.new
    end

    def edit
    end

    def create
      @menu_background = MenuBackground.new(menu_background_params)

      if @menu_background.save
        redirect_to admin_menu_background_path(@menu_background.uuid), notice: "Menu background was successfully created."
      else
        render action: 'new'
      end
    end

    def update
      if @menu_background.update(menu_background_params)
        redirect_to admin_menu_background_path(@menu_background.uuid), notice: "Menu background was successfully updated"
      else
        render action: 'edit'
      end
    end

    def destroy
      notice = @menu_background.destroy ? "Menu background was successfully deleted" : "Menu background was not successfully deleted"
      redirect_to admin_menu_backgrounds_path, notice: notice
    end

    private
      def set_menu_background
        @menu_background = MenuBackground.find_by_uuid(params[:id])
      end

      def menu_background_params
        params.require(:menu_background).permit(:id,
                                                :title,
                                                :activation,
                                                activation: [],
                                                background_attributes: [:border, :border_style, :delete_background_image, :no_background_image, :background_image, :background_image_cache, :no_repeat, :border_color]
                                               )
      end
  end
end
