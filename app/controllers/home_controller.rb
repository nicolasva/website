class HomeController < ApplicationController
  def index
    if Category.joins(:homepage_submenu).exists?(:homepage_submenus => { :homepage => true})
      if Category.joins(:homepage_submenu).where(:homepage_submenus => { :homepage => true}).first.contents_or_annoncment.nil? || Category.joins(:homepage_submenu).where(:homepage_submenus => { :homepage => true}).first.contents_or_annoncment.content_or_annoncment == false
        @contents = Category.joins(:homepage_submenu).where(:homepage_submenus => { :homepage => true}).first.contents
      else
        @annoncments = Category.joins(:homepage_submenu).where(:homepage_submenus => { :homepage => true}).first.annoncments
      end
    else
      if Submenu.joins(:homepage_submenu).where(:homepage_submenus => { :homepage => true }).first.contents_or_annoncment.nil? || Submenu.joins(:homepage_submenu).where(:homepage_submenus => { :homepage => true }).first.contents_or_annoncment.content_or_annoncment == false
        @contents = Submenu.joins(:homepage_submenu).where(:homepage_submenus => { :homepage => true }).first.contents
      else
        @annoncments = Submenu.joins(:homepage_submenu).where(:homepage_submenus => { :homepage => true }).first.annoncments
      end
    end
  end
end
