class CategoriesSubMenusAnnoncmentsController < ApplicationController
  before_action :set_categories_sub_menus_annoncments, only: [:show]

  def show
    respond_to do |format|
      format.html
      format.json { render json: @annoncment.to_json(:include => [:category, :submenu]) }
    end
  end

  private
    def set_categories_sub_menus_annoncments
      @annoncment = Annoncment.find(params[:id])
    end
end
