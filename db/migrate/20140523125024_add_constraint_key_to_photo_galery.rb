class AddConstraintKeyToPhotoGalery < ActiveRecord::Migration
  def change
    add_column :galery_photos, :category_id, :integer, null: true
    add_column :galery_photos, :submenu_id, :integer, null: true
    
    add_index :galery_photos, [:category_id], name: "galery_photos_category_id_to_category"
    add_index :galery_photos, [:submenu_id], name: "galery_photos_submenu_id_to_submenu"
  end
end
