module AnnoncmentsHelper
  def link_edit_admin_annoncment_path(annoncment)
    return @submenu.nil? ? edit_admin_title_annoncment_path(@category.title, annoncment.title) : edit_admin_title_title_submenu_annoncment_path(@category.title, @submenu.title, annoncment.title)
  end

  def link_destroy_admin_annoncment_path(annoncment)
    return @submenu.nil? ? admin_title_annoncment_path(@category.title, annoncment.title) : admin_title_title_submenu_annoncment_path(@category.title, @submenu.title, annoncment.title)
  end

  def link_new_annoncment_path
    return @submenu.nil? ? new_admin_title_annoncment_path(@category.title) : new_admin_title_title_submenu_annoncment_path(@category.title, @submenu.title)
  end

  def link_new_admin_title_annoncment_path
    return @submenu.nil? ? new_admin_title_annoncment_path(@category.title) : new_admin_title_title_submenu_annoncment_path(@category.title, @submenu.title)
  end

  def url_form_new_annoncment_path
    return @submenu.nil? ? "/admin/categories/#{@category.title}/annoncments" : "/admin/categories/#{@category.title}/submenus/#{@submenu.title}/annoncments"
  end

  def url_form_edit_annoncment_path
    return @submenu.nil? ? "/admin/categories/#{@category.title}/annoncments/#{@annoncment.title}" : "/admin/categories/#{@category.title}/submenus/#{@submenu.title}/annoncments/#{@annoncment.title}" 
  end

  def url_annoncment_show(annoncment)
    return annoncment.submenu.nil? ? title_annoncment_path(annoncment.category.title, annoncment.title) :  title_title_submenu_title_annoncment_path(annoncment.submenu.category.title, annoncment.submenu.title, annoncment.title)
  end
end
