class AddColumnNoBackgroundImageToBackgrounds < ActiveRecord::Migration
  def change
    add_column :backgrounds, :no_background_image, :boolean, default: false
    add_column :backgrounds, :no_repeat, :boolean, default: false
    #t.string  "photo_cache"
    add_column :backgrounds, :background_image_cache, :string
  end
end
