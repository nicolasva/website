class RenameColumnAnnoncmentsIdToAnnoncmentIdForPhotos < ActiveRecord::Migration
  def change
    rename_column :photos, :annoncments_id, :annoncment_id
    add_index :photos, [:annoncment_id], name: :photos_annoncment_id_to_photo
  end
end
