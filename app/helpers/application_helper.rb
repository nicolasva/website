module ApplicationHelper
  def link_panel_edit_category
    Rails.logger.info "-=-=-=-=-=-=-=-category-=-=-=-=-=-=-#{@category}"
    @submenu.nil? ? edit_admin_title_path(@category) : edit_admin_title_path(@category.category)
  end
  def link_content_or_annoncment?(value, category_title)
    hash_link_content_or_annoncment = Hash.new
    hash_link_content_or_annoncment["contents"] = link_to("Retourner a la liste du contenus", admin_title_contents_path(category_title), class: "btn btn-default")
    hash_link_content_or_annoncment["annoncments"] = link_to("Retourner a la liste du annonces", admin_title_contents_path(category_title), class: "btn btn-default") 
    return hash_link_content_or_annoncment[value]
  end
end
