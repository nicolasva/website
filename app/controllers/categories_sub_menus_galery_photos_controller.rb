class CategoriesSubMenusGaleryPhotosController < ApplicationController
  before_action :set_categories_sub_menus_galery_photos, only: [:show]

  def show
    respond_to do |format|
      format.html
      unless @galery_photo.submenu.nil?
        if @galery_photo.submenu.category.sub_menu
          format.json { render json: @galery_photo.to_json(:include => [:submenu => { :include => :category}]) }
        else
          format.json { render json: @galery_photo.to_json(:include => :category) }
        end
      else
          format.json { render json: @galery_photo.to_json(:include => :category) }
      end
    end
  end

  private
    def set_categories_sub_menus_galery_photos
      @galery_photo = GaleryPhoto.find(params[:id])
    end
end
