class ChangeColumnContentCachedPathToBackgroundImagePath < ActiveRecord::Migration
  def change
    rename_column(:contents, :cached_path, :background_image_cache)
  end
end
