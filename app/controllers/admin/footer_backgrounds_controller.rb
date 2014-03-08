module Admin
  class FooterBackgroundsController < AdminController
    before_action :set_footer_background, only: [:show, :edit, :update, :destroy]

    def index
      @footer_backgrounds = FooterBackground.all
    end

    def show
    end

    def new
      @footer_background = FooterBackground.new
    end

    def edit
    end

    def create
      @footer_background = FooterBackground.new(footer_background_params)
      
      if @footer_background.save
        redirect_to admin_footer_backgrounds_path(@footer_background.uuid), notice: 'Footer background was successfully created.'
      else
        render action: 'new'
      end
    end

    def update
      if @footer_background.update(footer_background_params)
        redirect_to admin_footer_backgrounds_path(@footer_background.uuid), notice: 'Footer background was successfully updated.'
      else
        render action: 'edit'
      end
    end

    def destroy
      @footer_background.destroy ? "Footer background was successfully deleted." : "Footer background was not successfully deleted."
      redirect_to admin_footer_backgrounds_path
    end

    private
    def set_footer_background
      @footer_background = FooterBackground.find(params[:id])
    end

    def footer_background_params
      params.require(:footer_background).permit(:id,
                                                :title,
                                                :activation,
                                                activation: [],
                                                background_attributes: [:border, :border_style, :delete_background_image, :no_background_image, :background_image, :background_image_cache, :no_repeat, :border_color]
                                               )
    end
  end
end
