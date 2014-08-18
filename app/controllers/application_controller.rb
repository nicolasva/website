class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :load_category
  before_filter :load_menu_background
  before_filter :load_sub_menu_background
  before_filter :load_robot_keys
  before_filter :load_title_website
  before_filter :load_header_background

  def load_header_background
    @header_background = HeaderBackground.find_by_activation(true) if HeaderBackground.exists?(activation: true, watch_title: true)
  end

  def load_title_website
    @title_website = TitleWebsite.exists?(activation: true) ? TitleWebsite.find_by_activation(true) : TitleWebsite.order(:id).first
  end

  def load_category
    @category_all = Category.all.order(:position)
  end

  def load_sub_menu_background
    @sub_menu_background = SubMenuBackground.exists?(:activation => true) ? SubMenuBackground.find_by_activation(true) : SubMenuBackground.order(:id).first
  end

  def load_menu_background
    @menu_background = MenuBackground.exists?(:activation => true) ? MenuBackground.find_by_activation(true) : MenuBackground.order(:id).first
  end

  def load_robot_keys
    @robot_keys = Robot::Key.all
  end

  def load_category_by_title
    #@category = params[:title_submenu_id].nil? ? Category.find_by_title(params[:title_id]) : Category.find_by_title(params[:title_id]).submenus.find_by_title(params[:title_submenu_id])
    @category = Category.find_by_title(params[:title_id]) 
    unless request.url.scan(/^.{1,}(submenus).{1,}$/).empty?
      @category = load_submenu_by_title(@category) unless params[:title_submenu_id].nil? && params[:id].nil?
    end
  end

  def load_annoncment_by_title
    @annoncment = Annoncment.find_by_title(params[:annoncment_id])
    unless request.url.scan(/^.{1,}(submenus).{1,}$/).empty?
      @annoncment = load_annoncment_by_title(@annoncment) unless params[:title_submenu_id].nil? && params[:id].nil?
    end
  end

  def load_submenu_by_title(model)
    @submenu = model.submenus.find_by_title(params[:title_submenu_id].nil? ? params[:id] : params[:title_submenu_id])
  end


end
