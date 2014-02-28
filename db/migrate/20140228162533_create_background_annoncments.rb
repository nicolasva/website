class CreateBackgroundAnnoncments < ActiveRecord::Migration
  def change
    create_table :background_annoncments do |t|
      t.references :annoncment
      t.timestamps
    end

    add_index :background_annoncments, [:annoncment_id], name: :background_annoncment_id_to_annoncments
  end
end
