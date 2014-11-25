module Admin
  class FooterBackgroundsController < AdminController
    before_action :set_footer_background, only: [:show, :edit, :update, :destroy]

    def index
      @footer_backgrounds = FooterBackground.all
    end

    def show
      respond_to do |format|
        format.html
        format.json { render json: @footer_background.to_json(:include => :background) }
      end
    end

    def new
      @footer_background = FooterBackground.new
    end

    def edit
    end

    def create
      @footer_background = FooterBackground.new(footer_background_params)
      
      if @footer_background.save
        redirect_to admin_footer_backgrounds_path, notice: t(".footer_background_success_created")
      else
        render action: 'new'
      end
    end

    def update
      if @footer_background.update(footer_background_params)
        redirect_to admin_footer_backgrounds_path, notice: t(".footer_background_success_updated")
      else
        render actions: 'edit'
      end
    end

    def destroy
      @footer_background.destroy ? t(".footer_background_success_destroy") : t(".footer_background_was_not_success_destroy")
      redirect_to admin_footer_backgrounds_path
    end

    def activation
      notice = FooterBackground.activation!(params[:footer_background][:activation]) ? t(".activation_was_success_defined") : t(".activation_was_not_success_defined") 
      redirect_to admin_footer_backgrounds_path, notice: notice
    end

    private
    def set_footer_background
      @footer_background = FooterBackground.find_by_uuid(params[:id])
    end

    def footer_background_params
      params.require(:footer_background).permit(:id,
                                                :title,
                                                :color_font,
                                                :activation,
                                                activation: [],
                                                font_attributes: [:font_family, :font_size, :id],
                                                #click_link_attributes: [:color, :background_color, :id],
                                                background_attributes: [:border, :border_style, :background_color, :delete_background_image, :no_background_image, :background_image, :cached_path, :no_repeat, :border_color, :background_image_size, :cover, :opacity, :transparent, :id]
                                               )
    end
  end
end
