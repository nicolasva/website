module ApplicationHelper
  def link_content_or_annoncment?(value, content_annoncment)
    hash_link_content_or_annoncment = Hash.new
    hash_link_content_or_annoncment["contents"] = link_to("Retourner a la liste du contenus", @submenu.nil? ? admin_title_contents_path(content_annoncment.category.title) : admin_title_title_submenu_contents_path(content_annoncment.submenu.category.title, @submenu.title), class: "btn btn-default")
    hash_link_content_or_annoncment["annoncments"] = link_to("Retourner a la liste du annonces", @submenu.nil? ? admin_title_annoncments_path(content_annoncment.category.title) : admin_title_title_submenu_annoncments_path(content_annoncment.submenu.category.title, @submenu.title), class: "btn btn-default") 
    return hash_link_content_or_annoncment[value]
  end

  def datetime_month
    array_datetime = Array.new
  
  end

  def time_tag_helper_date_format
    I18n.locale == :fr ? '%d/%m/%Y' : '%Y/%m/%d'
  end

  def time_tag_helper_month(annoncment_date)
    annoncment_date_array = annoncment_date.split("/")
    day_or_year = annoncment_date_array[0]
    month = t("month_date.#{annoncment_date_array[1].to_i.to_s}")
    year = annoncment_date_array[2]

    return "#{day_or_year.to_s} #{month.to_s} #{year.to_s}"
  end

  def categorie_title(categorie)
    return I18n.locale == :fr ? categorie.title : categorie.english_title
  end
  
  def annoncment_title(annoncment)
    return I18n.locale == :fr ? annoncment.title : annoncment.english_title
  end

  def galery_photo_title(galery_photo)
    return I18n.locale == :fr ? galery_photo.title : galery_photo.english_title
  end

  def galery_photo_comment(galery_photo)
    return I18n.locale == :fr ? galery_photo.comment : galery_photo.english_comment
  end

  def sub_menu_title(sub_menu)
    return I18n.locale == :fr ? sub_menu.title : sub_menu.english_title
  end

  def annoncment_title(annoncment)
    return I18n.locale == :fr ? annoncment.title : annoncment.english_title
  end

  def annoncment_description(annoncment)
    return I18n.locale == :fr ? annoncment.description : annoncment.english_description
  end

  def get_link_content_or_annoncment
    case request.path.scan(/^.{1,}(contents|annoncments|galery_photos)|.{1,}$/)[0][0]
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
