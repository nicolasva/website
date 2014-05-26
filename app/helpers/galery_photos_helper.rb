module GaleryPhotosHelper
  def edit_admin_galery_photo_path(galery_photo)
    return @submenu.nil? ? edit_admin_title_galery_photo_path(galery_photo.uuid) : edit_admin_title_title_submenu_galery_photo(galery_photo.uuid)
  end

  def destroy_admin_galery_photo_path(galery_photo)
    return @submenu.nil? ? admin_title_galery_photo_path(galery_photo.uuid) : admin_title_title_submenu_galery_photo_path(galery_photo.uuid)
  end

  def new_admin_galery_photo_path
    return @submenu.nil? ? new_admin_title_galery_photo_path : new_admin_title_title_submenu_galery_photo_path
  end
end
