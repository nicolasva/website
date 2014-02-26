class CreateContentsOrAnnoncments < ActiveRecord::Migration
  def change
    create_table :contents_or_annoncments do |t|
      t.boolean :content_or_annoncment, default: true, null: false
      t.integer :contents_or_annoncments_id
      t.string :contents_or_annoncments_type
      t.timestamps
    end
  end
end
