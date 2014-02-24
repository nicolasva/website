class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :load_category

  def load_category
    @category = Category.all
  end


  def load_category_by_title
      @category = params[:title_submenu_id].nil? ? Category.find_by_title(params[:title_id]) : Category.find_by_title(params[:title_id]).submenus.find_by_title(params[:title_submenu_id])
  end

  def load_annoncment_by_title
    @annoncment = params[:title_submenu_id].nil? ? Annoncment.find_by_title(params[:annoncment_id]) : Annoncment.find_by_title(params[:annoncment_id]).submenus.find_by_title(params[:title_submenu_id])
  end
end
