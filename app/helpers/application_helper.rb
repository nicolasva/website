module ApplicationHelper
  def link_content_or_annoncment?(value, content_annoncment)
    hash_link_content_or_annoncment = Hash.new
    hash_link_content_or_annoncment["contents"] = link_to("Retourner a la liste du contenus", @submenu.nil? ? admin_title_contents_path(content_annoncment.category.title) : admin_title_title_submenu_contents_path(content_annoncment.submenu.category.title, @submenu.title), class: "btn btn-default")
    hash_link_content_or_annoncment["annoncments"] = link_to("Retourner a la liste du annonces", @submenu.nil? ? admin_title_annoncments_path(content_annoncment.category.title) : admin_title_title_submenu_annoncments_path(content_annoncment.submenu.category.title, @submenu.title), class: "btn btn-default") 
    return hash_link_content_or_annoncment[value]
  end

  def get_link_content_or_annoncment
    case request.path.scan(/^.{1,}(contents|annoncments|galery_photos).{1,}$/)[0][0]
      when "contents"
        link = @content
      when "annoncments"
        link = @annoncment
      when "galery_photos"
        link = @galery_photo
    end

    return link
  end

  def contents_or_annoncments?(contents_or_annoncment)
    return contents_or_annoncment.nil? ? true : contents_or_annoncment.content_or_annoncment
  end

  def home_page_submenu?(homepage_submenu)
    return homepage_submenu.nil? ? false : homepage_submenu.homepage
  end

  def contents_annoncments?
    @contents.nil?
  end

  def get_parent
    if contents_annoncments?
      if @annoncments.nil?
        @galery_photos
      else
        @annoncments
      end
    else
      @contents
    end
  end

  def submenu?
    if contents_annoncments?
      if @annoncments.nil? || @annoncments.empty?
        if @galery_photos.nil? || @galery_photos.empty?
          false
        else
          !@galery_photos.first.submenu.nil?
        end
      else
        !@annoncments.first.submenu.nil?
      end
    else
      if @contents.nil? || @contents.empty?
        if @galery_photos.nil? || @galery_photos.empty?
          false
        else
          !@galery_photos.first.submenu.nil?
        end
      else
        !@contents.first.submenu.nil?
      end
    end
  end
end
