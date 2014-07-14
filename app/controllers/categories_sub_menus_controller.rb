class CategoriesSubMenusController < ApplicationController
  before_action :set_categories_sub_menu, only: [:show]

  def index
    if Category.all.joins(:homepage_submenu).where(:homepage_submenus => {:homepage => true}).exists?
      @category = Category.all.joins(:homepage_submenu).where(:homepage_submenus => {:homepage => true}).first
    else
      @category = Category.where(:sub_menu => true).joins(:submenus).joins(:homepage_submenu).where(:homepage_submenus => {:homepage => true}).first
    end

    respond_to do |format|
      format.html
      format.json { render json: @category.to_json(:include => [:submenus => { :include => :homepage_submenu}]) }
    end
  end

  def show
    respond_to do |format|
      format.html
      unless @content.submenu.nil?
        if @content.submenu.category.sub_menu
          format.json { render json: @content.to_json(:include => [:submenu => { :include => :category}]) }
        else
          format.json { render json: @content.to_json(:include => :category) }
        end
      else
        format.json { render json: @content.to_json(:include => :category) }
      end
    end
  end

  private
    def set_categories_sub_menu
      @content = Content.find_by_uuid(params[:id])
    end
end
