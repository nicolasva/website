module Admin
  class ContentsController < AdminController
    before_action :set_content, only: [:show, :edit, :update, :destroy]
    before_action :load_category_by_title
    
    def index
      @contents = @category.contents.order(:position)
    end

    def new
      @content = @category.contents.new
    end

    def edit

    end

    def create
      @content = @category.contents.new(content_params)

      if @content.save
        if @submenu.nil?
          redirect_to admin_title_content_path(@content.category.title, @content.uuid), notice: t(".content_successfully_created")
        else
          redirect_to admin_title_title_submenu_content_path(@content.submenu.category.title, @content.submenu.title, @content.uuid), notice: t(".content_successfully_created")
        end
      else
        render action: 'new'
      end
    end

    def update
      if @content.update_with_image(content_params)
        if @submenu.nil?
          redirect_to admin_title_content_path(@content.category.title, @content.uuid), notice: t(".content_successfully_updated")
        else
          redirect_to admin_title_title_submenu_content_path(@content.submenu.category.title, @content.submenu.title, @content.uuid), notice: t(".content_successfully_updated")
        end
      else
        render action: 'edit'
      end
    end

    def show
        @content = Content.find_by_uuid(params[:id])
    
        respond_to do |format|
          format.html
          format.json { render json: @content}
        end
    end

    def copy
     @content = @category.contents.find_by_uuid(params[:content_uuid_for_copy])

     @content = Content.new(:description => @content.description, :category_id => @content.category_id, :english_description => @content.english_description, :submenu_id => @content.submenu_id, :background_attributes => { :border => @content.background.border, :border_style => @content.background.border_style, :border_color => @content.background.border_color, :background_color => @content.background.background_color, :background_image => @content.background.background_image, :cached_path => @content.background.cached_path, :backgroundstyles_id => @content.background.backgroundstyles_id, :backgroundstyles_type => @content.background.backgroundstyles_type, :no_background_image => @content.background.no_background_image, :no_repeat => @content.background.no_repeat, :background_image_cache => @content.background.background_image_cache, :align => @content.background.align})
     if @content.save
       notice = "La copie de ce nouveau contenu s'est bien déroulé"
     else
       notice = "La copie de ce nouveau contenu ne s'est pas correctement déroulé"
     end

     if @submenu.nil? 
       redirect_to admin_title_contents_path(@content.category.title), notice: notice 
     else
        redirect_to admin_title_title_submenu_contents_path(@content.category.title, @submenu.title), notice: notice
     end
    end

    def destroy
      notice = @content.destroy ? t(".content_successfully_destroy") : t(".content_was_not_successfully_destroy")
      if @submenu.nil?
        redirect_to admin_title_contents_path(@content.category.title), notice: notice 
      else
        redirect_to admin_title_title_submenu_contents_path(@content.category.title, @submenu.title), notice: notice
      end
    end

    def sort
      params[:content].each_with_index do |id, index|
        Content.position(index+1, id)
      end

      render :nothing => true
    end

    private
      def set_content
        @content = Content.find_by_uuid(params[:id])
      end

      def content_params
        params.require(:content).permit(:id,
                                        :description,
                                        :english_description,
                                        :category_id,
                                        :border,
                                        :border_style,
                                        :border_color,
                                        :background_color,
                                        :background_image,
                                        :background_image_cache, 
                                        :no_repeat,
                                        :no_background_image,
                                        background_attributes: [:border, :border_style, :background_color, :delete_background_image, :no_background_image, :background_image, :background_image_cache, :no_repeat, :border_color, :align, :background_image_size, :cover]
                                       )
      end
  end
end
