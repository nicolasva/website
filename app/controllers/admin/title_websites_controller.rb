module Admin
  class TitleWebsitesController < AdminController
    before_action :set_title_website, only: [:show, :edit, :update, :destroy]

    def index
      @title_website = TitleWebsite.all
    end

    def new
      @title_website = TitleWebsite.new
    end

    def edit
    end

    def create
      @title_website = TitleWebsite.new(title_website_params)
      @notice = "Le titre pour le site a bien été crée"
      respond_to do |format|
        if @title_website.save
          format.html { redirect_to admin_title_websites_path, notice: @notice }
          format.js
        else
          @notice = "Le titre pour le site n'a pas été correctement crée"
          format.html { render action: 'new' }
          format.js { redirect_to(:action => :create_error_title_website, :format => :js)}
        end
      end
    end

    def update
      @notice = "Le titre du site a bien été mise à jour"
      respond_to do |format|
        if @title_website.update(title_website_params)
          format.html { redirect_to admin_title_websites_path, notice: @notice }
          format.js
        else
          @notice = "Le titre du site n'a pas été correctement mise à jour"
          format.html { render action: 'edit' }
          format.js { redirect_to(:action => :create_error_title_website, :format => :js)}
        end
      end
    end

    def destroy
      notice = @title_website.destroy ? "La supression de ce titre pour ce site s'est bien déroulé" : "La supression de ce titre pour ce site ne s'est pas déroulé correctement"
      redirect_to admin_title_websites_path, notice: notice
    end

    private
      def set_title_website
        @title_website = TitleWebsite.find_by_title(params[:id])
      end

      def title_website_params
        params.require(:title_website).permit(:id,
                                              :title,
                                              :activation)
      end
  end
end
