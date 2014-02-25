module ApplicationHelper
  def link_content_or_annoncment?(value, category_title)
    hash_link_content_or_annoncment = Hash.new
    hash_link_content_or_annoncment["contents"] = link_to("Retourner a la liste du contenus", @submenu.nil? ? admin_title_contents_path(category_title) : admin_title_title_submenu_contents_path(category_title, @submenu.title), class: "btn btn-default")
    hash_link_content_or_annoncment["annoncments"] = link_to("Retourner a la liste du annonces", @submenu.nil? ? admin_title_annoncments_path(category_title) : admin_title_title_submenu_annoncments_path(category_title, @submenu.title), class: "btn btn-default") 
    return hash_link_content_or_annoncment[value]
  end
end
