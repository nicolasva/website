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
        redirect_to admin_header_background_path(@header_background.uuid), notice: 'Header background was successfully created.'
      else
        render action: 'new'
      end
    end

    def update
      if @header_background.update(header_background_params)
        redirect_to admin_header_background_path(@header_background.uuid), notice: 'Header background was successfully updated.'
      else
        render action: 'edit'
      end
    end

    def destroy
      notice = @header_background.destroy ? "Header background was successfully deleted" : "Header background was not successfully deleted"
      redirect_to admin_header_backgrounds_path, notice: notice
    end

    def activation
      notice = HeaderBackground.activation!(params[:header_background][:activation]) ? "Header background was successfully defined" : "Header background was not successfully defined"
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
                                                  background_attributes: [:border, :border_style, :delete_background_image, :no_background_image, :background_image, :background_image_cache, :no_repeat, :border_color]
                                                 )
      end
  end
end
