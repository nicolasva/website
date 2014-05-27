class HomeController < ApplicationController
  def index
    if Category.joins(:homepage_submenu).exists?(:homepage_submenus => { :homepage => true})
      if Category.joins(:homepage_submenu).where(:homepage_submenus => { :homepage => true}).first.contents_or_annoncment.nil? || Category.joins(:homepage_submenu).where(:homepage_submenus => { :homepage => true}).first.contents_or_annoncment.content_or_annoncment.to_i == 1
        @contents = Category.joins(:homepage_submenu).where(:homepage_submenus => { :homepage => true}).first.contents
      else
        if Category.joins(:homepage_submenu).where(:homepage_submenus => { :homepage => true}).first.contents_or_annoncment.content_or_annoncment.to_i == 0
          @annoncments = Category.joins(:homepage_submenu).where(:homepage_submenus => { :homepage => true}).first.annoncments
        else
          @galery_photos = Category.joins(:homepage_submenu).where(:homepage_submenus => { :homepage => true}).first.galery_photos
        end
      end
    else
      if Submenu.joins(:homepage_submenu).where(:homepage_submenus => { :homepage => true }).first.contents_or_annoncment.nil? || Submenu.joins(:homepage_submenu).where(:homepage_submenus => { :homepage => true }).first.contents_or_annoncment.content_or_annoncment == 1
        @contents = Submenu.joins(:homepage_submenu).where(:homepage_submenus => { :homepage => true }).first.contents
      else
        if Submenu.joins(:homepage_submenu).where(:homepage_submenus => { :homepage => true }).first.contents_or_annoncment.content_or_annoncment == 0
          @annoncments = Submenu.joins(:homepage_submenu).where(:homepage_submenus => { :homepage => true }).first.annoncments
        else
          @galery_photos = Submenu.joins(:homepage_submenu).where(:homepage_submenus => { :homepage => true }).first.galery_photos
        end
      end
    end
  end
end
