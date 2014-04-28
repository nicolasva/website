module Admin
  class SubmenusController < AdminController
    before_action :load_category_by_title 
    before_action :set_submenu, only: [:show, :edit, :update, :destroy, :update_success]
    
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

    def update_success
      @submenu_id = @submenu.id
    end

    def update
      respond_to do |format|
        if @submenu.update(submenu_params)
          format.html { redirect_to admin_title_title_submenu_path(@category.title, @submenu.title), notice: "Submenu was successfully updated" }
          format.js { redirect_to(:action => :update_success, :title_id => @category.title, :title_submenu_id => @submenu.title, :format => :js) }
        else
          format.html { render action: 'edit' }
        end
      end
    end

    def content_or_annoncment_homepage
      Submenu.content_or_annoncment(params[:submenu][:contents_or_annoncments_attributes])
      Submenu.homepage_submenu(params[:submenu][:homepage_submenus_attributes]) unless params[:submenu][:homepage_submenus_attributes].nil?
      params.keys.each do |k|
        #Rails.logger.info k
        #redirection_url(k,notice)
        notice = "les informations concernants les sous-menus ont bien été mise à jour"
        params_array = k.split("_")
        case params_array.first
          when "content"
            redirect_to admin_title_title_submenu_contents_path(@category.title, params_array.last), notice: notice
          when "annoncment"
            redirect_to admin_title_title_submenu_annoncments_path(@category.title, params_array.last), notice: notice
          when "allsubmenu"
            redirect_to admin_title_title_submenu_annoncments_path(params[:title_id]), notice: notice
        end
      end
    end

    def destroy
      @submenu.destroy
      redirect_to admin_title_title_submenu_index_path(@submenu.category.title), notice: "Submenu was successfully destroyed"
    end

    private
     def set_submenu
       @submenu = @category
     end

     def submenu_params
        params.require(:submenu).permit(:id,
                                       :title)
     end
  end
end
