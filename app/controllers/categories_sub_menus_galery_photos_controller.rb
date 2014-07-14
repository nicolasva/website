class CategoriesSubMenusGaleryPhotosController < ApplicationController
  before_action :set_categories_sub_menus_galery_photos, only: [:show]

  def show
    respond_to do |format|
      format.html
      format.json { render json: @galery_photo.to_json(:include => [:submenu => { :include => :category}]) }
    end
  end

  private
    def set_categories_sub_menus_galery_photos
      @galery_photo = GaleryPhoto.find(params[:id])
    end
end
