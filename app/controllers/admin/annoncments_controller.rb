module Admin
  class AnnoncmentsController < AdminController 
    before_action :set_annoncment, only: [:show, :edit, :update, :destroy]
    before_action :load_category_by_title

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
          redirect_to admin_title_annoncment_path(@category.title, @annoncment.title), notice: "Annoncment was successfully created"
        else
          redirect_to admin_title_title_submenu_annoncment_path(@category.title, @submenu.title, @annoncment.title), notice: "Annoncment was successfully created"
        end  
      else
        render action: 'new'
      end
    end

    def update
      if @annoncment.update_with_background_image(annoncment_params)
        if @submenu.nil?
          redirect_to admin_title_annoncment_path(@category.title, @annoncment.title), notice: "Annoncment was successfully updated"
        else
          redirect_to admin_title_title_submenu_annoncment_path(@category.title, @submenu.title, @Annoncment.title)
        end
      else
        render action: 'edit'
      end
    end

    def destroy
      @annoncment.destroy
      if @submenu.nil?
        redirect_to admin_title_annoncments_path(@category.title), notice: "Annoncment was successfully destroyed"
      else
        redirect_to admin_title_title_submenu_annoncments_path(@category.title, @submenu.title)
      end
    end

    def sort
      params[:annoncment].each_with_index do |id, index|
        Annoncment.position(index+1, id)
      end
    end

    private

      def set_annoncment
        @annoncment = Annoncment.find_by_title(params[:id])
      end

      def annoncment_params
        params.require(:annoncment).permit(:id,
                                           :title,
                                           :description,
                                           :english_description,
                                           :master_image,
                                           photos_attributes: [:photo, :master_image, :photo_cache, :annoncment_id],
                                           photos: [:master_image]
                                          ).tap do |annoncment|
                                            annoncment[:photos_attributes] = params[:annoncment][:photos_attributes]
                                            annoncment[:photos_master] = params[:annoncment][:photos_master]
                                          end

      end
  end
end
