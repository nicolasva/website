class CategoriesSubMenusAnnoncmentsController < ApplicationController
  before_action :set_categories_sub_menus_annoncments, only: [:show]

  def show
    respond_to do |format|
      format.html
      unless @annoncment.submenu.nil?
        if @annoncment.submenu.category.sub_menu
          format.json { render json: @annoncment.to_json(:include => [:submenu => { :include => :category}]) }
        else
          format.json { render json: @annoncment.to_json(:include => :category) }
        end
      else
          format.json { render json: @annoncment.to_json(:include => :category) }
      end
    end
  end

  private
    def set_categories_sub_menus_annoncments
      @annoncment = Annoncment.find(params[:id])
    end
end
