module Admin
  class BackgroundByDefaultsController < AdminController
    before_action :set_background_by_default, only: [:show, :edit, :update, :destroy]
    
    def index
      @background_by_defaults = BackgroundByDefault.all
    end  

    def show
      respond_to do |format|
        format.html
        format.json { render json: @background_by_default.to_json(:include => :background) }
      end
    end

    def new
      @background_by_default = BackgroundByDefault.new
    end

    def edit
    end

    def create
      @background_by_default = BackgroundByDefault.new(background_by_default_params)
    
      if @background_by_default.save
        redirect_to admin_background_by_default_path(@background_by_default.uuid), notice: 'Background by default was successfully created.'
      else
        render action: 'new'
      end
    end

    def update
      if @background_by_default.update(background_by_default_params)
        redirect_to admin_background_by_default_path(@background_by_default.uuid), notice: 'Background by default was successfully updated.'
      else
        render action: 'edit'
      end
    end

    def destroy
      if @background_by_default.destroy
        redirect_to  admin_background_by_defaults_path, notice: "Background by default was successfully destroyed"
      end
    end

    def activation
      notice = BackgroundByDefault.activation!(params[:background_by_default][:activation]) ? "The Background was successfully defined" : "The Background was not successfully defined"
      redirect_to admin_background_by_defaults_path, notice: notice
    end

    private
      def set_background_by_default
        @background_by_default = BackgroundByDefault.find_by_uuid(params[:id])
      end

      def background_by_default_params
        params.require(:background_by_default).permit(:id,
                                                      :title,
                                                      :activation,
                                                      activation: [],
                                                      background_attributes: [:border, :border_style, :background_color, :delete_background_image, :no_background_image, :background_image, :cached_path, :no_repeat, :border_color, :align]
                                                     )
      end
  end
end
