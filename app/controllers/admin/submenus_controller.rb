module Admin
  class SubmenusController < AdminController
    before_action :set_submenu, only: [:show, :edit, :update, :destroy]
    before_action :load_category_by_title
    
    def index
      @submenus = @category.submenus.order(:position, :created_at)
    end

    def new
      @submenu = @category.submenus.new
    end

    def edit
    end

    def sort
      params[:submenu].each_with_index do |id, index|
        Submenu.position(index+1, id)
      end

      render :nothing => true
    end

    def show
    end

    def create
      @submenu = @category.submenus.new(submenu_params)

      if @submenu.save
        redirect_to admin_title_title_submenu_path(@category.title, @submenu.title), notice: "Submenu was successfully created."
      else
        render action: 'new'
      end
    end

    def update
      if @submenu.update(submenu_params)
        redirect_to admin_title_title_submenus_path(@category.title, @submenu.title), notice: "Submenu was successfully updated"
      else
        render action: 'edit'
      end
    end

    def destroy
      @submenu.destroy
      redirect_to admin_title_title_submenu_path(@category.title, @submenu.title), notice: "Submenu was successfully destroyed"
    end

    private
      def set_submenu
        @submenu = Submenu.find_by_title(params[:id])
      end

      def submenu_params
        params.require(:submenu).permit(:id,
                                       :title)
      end
  end
end
