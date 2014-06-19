module Admin
  class HeaderBackgroundsController < AdminController
    before_action :set_header_background, only: [:show, :edit, :update, :destroy]

    def index
      @header_backgrounds = HeaderBackground.all
    end

    def show
      respond_to do |format|
        format.html
        format.json { render json: @header_background.to_json(:include => :background)}
      end
    end

    def new
      @header_background = HeaderBackground.new
    end

    def edit

    end

    def create
      @header_background = HeaderBackground.new(header_background_params)

      if @header_background.save
        redirect_to admin_header_backgrounds_path, notice: t(".header_background_success_created")
      else
        render action: 'new'
      end
    end

    def update
      if @header_background.update(header_background_params)
        redirect_to admin_header_backgrounds_path, notice: t(".header_background_success_updated")
      else
        render action: 'edit'
      end
    end

    def destroy
      notice = @header_background.destroy ? (".header_background_success_destroy") : t(".header_background_not_success_destroy")
      redirect_to admin_header_backgrounds_path, notice: notice
    end

    def activation
      notice = HeaderBackground.activation!(params[:header_background][:activation]) ? t(".header_background_success_defined") : (".header_background_not_success_desfined")
      redirect_to admin_header_backgrounds_path, notice: notice
    end

    private
      def set_header_background
        @header_background = HeaderBackground.find_by_uuid(params[:id])
      end

      def header_background_params
        params.require(:header_background).permit(:id,
                                                  :title,
                                                  :activation,
                                                  activation: [],
                                                  background_attributes: [:border, :border_style, :background_color, :delete_background_image, :no_background_image, :background_image, :cached_path, :no_repeat, :border_color, :align, :background_image_size, :cover, :id]
                                                 )
      end
  end
end
