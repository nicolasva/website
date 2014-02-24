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
          redirect_to admin_title_content_path(@category.title, @content.uuid), notice: "Content was successfully created"
        else
          redirect_to admin_title_title_submenu_content_path(@category.title, @submenu.title, @content.uuid), notice: "Content was successfully created"
        end
      else
        render action: 'new'
      end
    end

    def update
      if @content.update_with_background_image(content_params)
        redirect_to admin_title_content_path(@category.title, @content.uuid), notice: "Content was successfully updated."
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

    def destroy
      @content.destroy
      redirect_to admin_title_contents_path(@content.category.title), notice: "Content was successfully destroyed"
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
                                        :delete_background_image,
                                        :no_repeat,
                                        :no_background_image
                                       )
      end
  end
end
