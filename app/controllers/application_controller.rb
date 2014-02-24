class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :load_category

  def load_category
    @category = Category.all
  end


  def load_category_by_title
    #@category = params[:title_submenu_id].nil? ? Category.find_by_title(params[:title_id]) : Category.find_by_title(params[:title_id]).submenus.find_by_title(params[:title_submenu_id])
    @category = Category.find_by_title(params[:title_id])
    @category = load_submenu_by_title(@category) unless params[:title_submenu_id].nil?
  end

  def load_annoncment_by_title
    @annoncment = Annoncment.find_by_title(params[:annoncment_id])
    @annoncment = load_annoncment_by_title(@annoncment) unless params[:title_submenu_id].nil?
  end

  def load_submenu_by_title(model)
    @submenu = Submenu.find_by_title(params[:title_submenu_id])
  end


end
