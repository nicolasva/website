module Admin
  class SubMenuBackgroundsController < AdminController
    before_action :set_sub_menu_background, only: [:show, :edit, :update, :destroy]

    def index
      @sub_menu_backgrounds = SubMenuBackground.all
    end

    def show
      respond_to do |format|
        format.html
        format.json { render json: @sub_menu_background.to_json(:include => [:background, :align]) }
      end
    end

    def new
      @sub_menu_background = SubMenuBackground.new
    end

    def edit
    end

    def create
      @sub_menu_background = SubMenuBackground.new(sub_menu_background_params)
      
      if @sub_menu_background.save
        redirect_to admin_sub_menu_backgrounds_path, notice: t(".sub_menu_background_success_created")
      else
        render action: 'new'
      end
    end

    def update
      if @sub_menu_background.update(sub_menu_background_params)
        if @sub_menu_background.update_with_image(sub_menu_background_params)
          redirect_to admin_sub_menu_backgrounds_path, notice: t(".sub_menu_background_success_updated")
        else
          render action: 'edit'
        end
      else
        render action: 'edit'
      end
    end

    def destroy
      notice = @sub_menu_background.destroy ? t(".sub_menu_background_success_deleted") : t(".sub_menu_background_not_success_deleted")
      redirect_to admin_sub_menu_backgrounds_path, notice: notice 
    end

    def activation
      notice = SubMenuBackground.activation!(params[:sub_menu_background][:activation]) ? t(".sub_menu_background_success_defined") : t(".sub_menu_background_not_success_defined")
      redirect_to admin_sub_menu_backgrounds_path, notice: notice
    end

    private
    def set_sub_menu_background
      @sub_menu_background = SubMenuBackground.find_by_uuid(params[:id])
    end

    def sub_menu_background_params
      params.require(:sub_menu_background).permit(:id,
                                                  :title,
                                                  :activation,
                                                  activation: [],
                                                  align_attributes: [:align],
                                                  background_attributes: [:border, :border_style, :background_color, :delete_background_image, :no_background_image, :background_image, :cached_path, :no_repeat, :border_color, :background_image_size, :cover]
                                                 )
    end
  end
end
