class AddColumnMasterImageToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :master_image, :boolean, :default => false
  end
end
