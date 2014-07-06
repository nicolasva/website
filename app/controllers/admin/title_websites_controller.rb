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
      @notice = t(".title_websites.create.title_website_success_created") 
      respond_to do |format|
        if @title_website.save
          format.html { redirect_to admin_title_websites_path, notice: @notice }
          format.js
        else
          @notice = t(".title_websites.create.title_website_was_not_success_created")
          format.html { render action: 'new' }
          format.js { redirect_to(:action => :create_error_title_website, :format => :js)}
        end
      end
    end

    def update
      @notice = t(".title_websites.update.title_website_success_defined") 
      respond_to do |format|
        if @title_website.update(title_website_params)
          format.html { redirect_to admin_title_websites_path, notice: @notice }
          format.js
        else
          @notice = t(".title_websites.update.title_website_success_not_defined")
          format.html { render action: 'edit' }
          format.js { redirect_to(:action => :create_error_title_website, :format => :js)}
        end
      end
    end

    def destroy
      notice = @title_website.destroy ? t(".title_websites.destroy.title_website_success_destroy") : t(".title_websites.destroy.title_website_not_success_destroy")
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
