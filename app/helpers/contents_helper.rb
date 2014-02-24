module ContentsHelper
  def link_admin_content_path
    @submenu.nil? ? new_admin_title_content_path(@category.title) : new_admin_title_title_submenu_content_path(@category.title, @submenu.title)
  end

  def url_form_new_content
    @submenu.nil? ? "/admin/categories/#{@category.title}/contents" : "/admin/categories/#{@category.title}/submenus/#{@submenu.title}/contents"
  end

  def look_category
    return @submenu.nil? ? @content.category.title : @content.submenu.category.title
  end
end
