module Admin
  class CategoriesController < AdminController
    before_action :set_category, only: [:show, :edit, :update, :destroy]

    def index
      @categories = Category.order(:position, :created_at)
    end

    def new
      @category = Category.new
    end

    def create
      @category = Category.new(category_params)

      respond_to do |format|
        if @category.save
          format.html { redirect_to admin_title_path(@category), :notice => "Category was successfully created." }
          format.js
        else
          format.html { render action: "new" }
          format.js { redirect_to(:action => :create_error, :format => :js) }
        end
      end
    end

    def show
    end

    def edit
    end

    def homepage
      Category.content_or_annoncment(params[:category][:contents_or_annoncments_attributes])
      Category.homepage_submenu(params[:category][:homepage_submenus_attributes]) unless params[:category][:homepage_submenus_attributes].nil?
      #@category = Category.find(category_params[:homepage].first)
      #@category = Category.find(category_params)
      
      #if Category.set_homepage_and_content(category_params)
      notice = "Homepage was successfully defined"
        #redirection_url(notice)
      params.keys.each do |k|
          #Rails.logger.info k
        redirection_url(k,notice)
      end
      #else
      #  notice = "Homepage was not successfully defined" 
      #  redirect_to admin_title_index_path, notice: notice 
      #end

    end

    def update
      respond_to do |format|
        if @category.update(category_params)
          format.html { redirect_to admin_title_path(@category), :notice => "Category was successfully updated." }
          format.js
        else
          format.html { render action: 'edit' }
          format.js { redirect_to(:action => :create_error, :format => :js) }
        end
      end
    end

    def destroy
      @category.destroy
      redirect_to admin_title_index_path, notice: "Category was successfully destroyed."
    end

    def sort
      params[:category].each_with_index do |id, index|
        Category.position(index+1, id)
      end

      render :nothing => true
    end

    private
      def set_category
        @category= Category.find(params[:id])
      end

      def category_params
        params.require(:category).permit(:id,
                                         :title,
                                         :english_title,
                                         :homepage,
                                         :position,
                                         homepage: [],
                                        )
      end
  end
end
