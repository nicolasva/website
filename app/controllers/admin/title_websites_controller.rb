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

      if @title_website.save
        redirect_to admin_title_websites_path, notice: "Le titre pour le site a bien été crée"
      else
        render action: 'new'
      end
    end

    def update
      if @title_website.update(title_website_params)
        redirect_to admin_title_websites_path, notice: "La mise à jour de ce titre pour ce site s'est bien déroulé"
      else
        render action: 'edit'
      end
    end

    def destroy
      notice = @title_website.destroy? ? "La supression de ce titre pour ce site s'est bien déroulé" : "La supression de ce titre pour ce site ne s'est pas déroulé correctement"
      redirect_to admin_title_websites_path, notice: notice
    end

    private
      def set_title_website
        @title_website = TitleWebsite.find(params[:id])
      end

      def title_website_params
        params.require(:title_website).permit(:id,
                                              :title,
                                              :activation)
      end
  end
end
