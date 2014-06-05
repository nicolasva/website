module Admin
  class AnnoncmentsController < AdminController 
    before_action :set_annoncment, only: [:show, :edit, :update, :destroy]
    before_action :load_category_by_title
    before_action :set_date_at_html_date_to_html, only: [:edit]

    def index
      @annoncments = @category.annoncments.order(:position, :created_at)
    end

    def new
      @annoncment = @category.annoncments.new
      @photos = @annoncment.photos.new
    end

    def edit
    end

    def sort
      params[:annoncment].each_with_index do |id, index|
        Annoncment.position(index+1, id)
      end

      render :nothing => true
    end

    def show
      @photo_master = @annoncment.photos.where(:master_image => true).first
    end

    def create 
      @annoncment = @category.annoncments.new(annoncment_params)

      if @annoncment.save
        if @submenu.nil?
          redirect_to admin_title_annoncment_path(@annoncment.category.title, @annoncment.title), notice: t(".announcment_was_successfully_created")
        else
          redirect_to admin_title_title_submenu_annoncment_path(@annoncment.submenu.category.title, @annoncment.submenu.title, @annoncment.title), notice: t(".announcment_was_successfully_created")
        end  
      else
        render action: 'new'
      end
    end

    def update
      if @annoncment.update_with_background_image(annoncment_params)
        if @submenu.nil?
          redirect_to admin_title_annoncment_path(@annoncment.category.title, @annoncment.title), notice: t(".announcment_was_successfully_updated")
        else
          redirect_to admin_title_title_submenu_annoncment_path(@annoncment.submenu.category.title, @annoncment.submenu.title, @annoncment.title), notice: t(".announcment_was_successfully_updated")
        end
      else
        render action: 'edit'
      end
    end

    def destroy
      notice = @annoncment.destroy ? t(".announcment_was_successfully_destroyed") : t(".announcment_was_not_successfully_destroyed")
      if @submenu.nil?
        redirect_to admin_title_annoncments_path(@annoncment.category.title), notice: notice 
      else
        redirect_to admin_title_title_submenu_annoncments_path(@annoncment.submenu.category.title, @annoncment.submenu.title), notice: notice
      end
    end

    def sort
      params[:annoncment].each_with_index do |id, index|
        Annoncment.position(index+1, id)
      end
    end

    private
      def set_date_at_html_date_to_html
        @annoncment.date_at_html = @annoncment.date_at.nil? ? Time.now.strftime("%d/%m/%Y") : @annoncment.date_at.strftime("%d/%m/%Y")
        @annoncment.date_to_html = @annoncment.date_to.nil? ? Time.now.strftime("%d/%m/%Y") : @annoncment.date_to.strftime("%d/%m/%Y")
      end

      def set_annoncment
        @annoncment = Annoncment.find_by_title(params[:id])
      end

      def annoncment_params
        params.require(:annoncment).permit(:id,
                                           :title,
                                           :english_title,
                                           :font_weight_title,
                                           :font_size_title,
                                           :text_decoration_title,
                                           :description,
                                           :english_description,
                                           :master_image,
                                           :date_at,
                                           :date_to,
                                           :date_to_html,
                                           :date_at_html,
                                           photos_attributes: [:photo, :master_image, :photo_cache, :annoncment_id],
                                           photos: [:master_image],
                                           background_attributes: [:border, :border_style, :background_color, :delete_background_image, :no_background_image, :background_image, :background_image_cache, :no_repeat, :border_color, :align]
                                          ).tap do |annoncment|
                                            annoncment[:photos_attributes] = params[:annoncment][:photos_attributes]
                                            annoncment[:photos_master] = params[:annoncment][:photos_master]
                                          end

      end
  end
end
