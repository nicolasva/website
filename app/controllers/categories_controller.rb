class CategoriesController < ApplicationController 
  before_action :set_category, only: [:show]

  def show
    respond_to do |format|
      format.json { render json: @category } 
    end
  end

  private
    def set_category
      @category = Category.find_by_title(params[:id])
    end

    def category_params
      params[:category]
    end
end
