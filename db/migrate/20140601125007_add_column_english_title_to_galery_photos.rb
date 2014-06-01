class AddColumnEnglishTitleToGaleryPhotos < ActiveRecord::Migration
  def change
    add_column :galery_photos, :english_title, :string, null: false, default: "English title"
  end
end
