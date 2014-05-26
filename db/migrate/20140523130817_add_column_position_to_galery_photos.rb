class AddColumnPositionToGaleryPhotos < ActiveRecord::Migration
  def change
    add_column :galery_photos, :position, :integer, :null => false, :default => 0 
  end
end
