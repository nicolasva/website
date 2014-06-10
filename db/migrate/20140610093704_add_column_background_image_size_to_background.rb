class AddColumnBackgroundImageSizeToBackground < ActiveRecord::Migration
  def change
    add_column :backgrounds, :background_image_size, :integer, :default => 0, :null => false
  end
end
