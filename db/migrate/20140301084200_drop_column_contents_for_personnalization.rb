class DropColumnContentsForPersonnalization < ActiveRecord::Migration
  def change
    remove_column :contents, :border
    remove_column :contents, :border_style
    remove_column :contents, :border_color
    remove_column :contents, :background_color
    remove_column :contents, :background_image
    remove_column :contents, :background_image_cache
    remove_column :contents, :no_repeat
    remove_column :contents, :no_background_image
  end
end
