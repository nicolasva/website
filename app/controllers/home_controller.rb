class HomeController < ApplicationController
  def index
    if Category.joins(:homepage_submenu).exists?(:homepage_submenus => { :homepage => true})
      @contents = Category.joins(:homepage_submenu).where(:homepage_submenus => { :homepage => true}).first.contents
    else
      @contents = Submenu.joins(:homepage_submenu).where(:homepage_submenus => { :homepage => true }).first.contents
    end
  end
end
