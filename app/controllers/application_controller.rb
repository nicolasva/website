class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :load_category
  before_filter :load_menu_background
  before_filter :load_sub_menu_background

  def load_category
    @category_all = Category.all.order(:position)
  end

  def load_sub_menu_background
    @sub_menu_background = SubMenuBackground.exists?(:activation => true) ? SubMenuBackground.find_by_activation(true) : SubMenuBackground.order(:id).first
  end

  def load_menu_background
    @menu_background = MenuBackground.exists?(:activation => true) ? MenuBackground.find_by_activation(true) : MenuBackground.order(:id).first
  end


  def load_category_by_title
    #@category = params[:title_submenu_id].nil? ? Category.find_by_title(params[:title_id]) : Category.find_by_title(params[:title_id]).submenus.find_by_title(params[:title_submenu_id])
    @category = Category.find_by_title(params[:title_id])
    @category = load_submenu_by_title(@category) unless params[:title_submenu_id].nil? && params[:id].nil?
  end

  def load_annoncment_by_title
    @annoncment = Annoncment.find_by_title(params[:annoncment_id])
    @annoncment = load_annoncment_by_title(@annoncment) unless params[:title_submenu_id].nil?
  end

  def load_submenu_by_title(model)
    @submenu = Submenu.find_by_title(params[:title_submenu_id].nil? ? params[:id] : params[:title_submenu_id])
  end


end
