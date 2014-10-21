class PersonalizeGaleryPhotoBackgrounds < ActiveRecord::Migration
  def change
    create_table :personalize_galery_photo_backgrounds do |t|
      t.string :uuid, null: false
      t.string :title, null: false
      t.boolean :activation, null: false
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
