module ContentsHelper
  def link_admin_content_path
    @submenu.nil? ? new_admin_title_content_path(@category.title) : new_admin_title_title_submenu_content_path(@category.category.title, @submenu.title)
  end

  def col_boostrap(contents)
    return contents.length > 1 ? "col-md-6" : "col-md-12"
  end

  def url_form_new_content
    @submenu.nil? ? "/admin/categories/#{@category.title}/contents" : "/admin/categories/#{@category.title}/submenus/#{@submenu.title}/contents"
  end

  def look_category
    return @submenu.nil? ? @content.category.title : @content.submenu.category.title
  end

  def link_edit_admin_content_path(content)
    return @submenu.nil? ? edit_admin_title_content_path(@category.title, content.uuid) : edit_admin_title_title_submenu_content_path(@category.title, @submenu.title, content.uuid)
  end

  def link_destroy_admin_content_path(content)
    return @submenu.nil? ? admin_title_content_path(@category.title, content.uuid) : admin_title_title_submenu_content_path(@category.title, @submenu.title, content.uuid)
  end

  def url_admin_edit_form_contents
    return @submenu.nil? ? "/admin/categories/#{@content.category.title}/contents/#{@content.uuid}" : "/admin/categories/#{@content.submenu.category.title}/submenus/#{@content.submenu.title}/contents/#{@content.uuid}"
  end
end
