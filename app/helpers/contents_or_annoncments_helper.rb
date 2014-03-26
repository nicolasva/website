module ContentsOrAnnoncmentsHelper
  def url_contents_or_annoncments(sub_menu)
    return sub_menu.contents_or_annoncment.nil? || sub_menu.contents_or_annoncment.content_or_annoncment ? title_title_submenu_contents_url(sub_menu.category.title, sub_menu.title) : title_title_submenu_annoncments_url(sub_menu.category.title, sub_menu.title) 
  end

  def url_contents_or_annoncments_directly_category(categorie)
    return categorie.contents_or_annoncment.nil? || categorie.contents_or_annoncment.content_or_annoncment ? title_contents_url(categorie.title) : title_annoncments_url(categorie.title)
  end
end
