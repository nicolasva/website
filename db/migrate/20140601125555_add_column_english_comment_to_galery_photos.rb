class AddColumnEnglishCommentToGaleryPhotos < ActiveRecord::Migration
  def change
    add_column :galery_photos, :english_comment, :text, null: false, default: "English comment"
  end
end
